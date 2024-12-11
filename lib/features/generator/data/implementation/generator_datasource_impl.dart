import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/generator/domain/models/export_models.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class GeneratorDatasourceImpl implements GeneratorDatasource {
  @override
  Future<Result<GeneratorResponse>> generateSuperhero() async {
    try {
      debugPrint('Starting superhero generation...');
      final response = await _generateSuperhero();

      if (response == null) {
        debugPrint('Failed to generate superhero.');
        return ResultError(
          'Failed to generate superhero.',
          StackTrace.current,
        );
      }

      debugPrint('Superhero generated: ${response.name}');
      final imageResponse = await _generateImage(response);

      if (imageResponse != null) {
        debugPrint('Image generated successfully.');
        return ResultSuccess(
          GeneratorResponse(
            superhero: response,
            image: imageResponse,
          ),
        );
      } else {
        debugPrint('Image generation failed.');
        return ResultError(
          'Image generation failed',
          StackTrace.current,
        );
      }
    } catch (error) {
      debugPrint('An error occurred while generating superhero: $error');
      return ResultError(
        'An error occurred while generating superhero: $error',
        StackTrace.current,
      );
    }
  }

  Future<AISuperhero?> _generateSuperhero() async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final headers = {
      'Authorization': 'Bearer ${dotenv.env['CHATGPT_API_KEY']}',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a superhero generator.'},
        {'role': 'user', 'content': _buildSuperheroPrompt()},
      ],
      'temperature': 0.7,
      'max_tokens': 200,
    });

    debugPrint('Sending request to generate superhero...');
    debugPrint('Request URL: $url');
    debugPrint('Request Headers: $headers');
    debugPrint('Request Body: $body');

    final response = await http.post(url, headers: headers, body: body);

    debugPrint('Response status code: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final result = data['choices'][0]['message']['content'] as String;
      debugPrint('Extracted result: $result');
      return AISuperhero.fromJson(result);
    } else {
      debugPrint('Failed to generate superhero: ${response.statusCode}');
      throw Exception('Failed to generate superhero');
    }
  }

  String _buildSuperheroPrompt() {
    return '''
      Generate a new superhero following this JSON structure:
      {
        "name": "A-Bomb",
        "powerstats": {
          "intelligence": 38,
          "strength": 100,
          "speed": 17,
          "durability": 80,
          "power": 24,
          "combat": 64
        },
        "appearance": {
          "race": "Human",
          "height": "203 cm",
          "weight": "441 kg",
        },
        "biography": "A short made up biography in 1-2 sentences.",
        "work": "Musician, adventurer, author; formerly talk show host"
      }
    ''';
  }

  Future<AIImage?> _generateImage(AISuperhero superhero) async {
    final url = Uri.parse('https://api.openai.com/v1/images/generations');
    final headers = {
      'Authorization': 'Bearer ${dotenv.env['CHATGPT_API_KEY']}',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'model': 'dall-e-3',
      'prompt': _buildImagePrompt(superhero),
      'num_images': 1,
    });

    debugPrint('Sending request to generate image...');
    debugPrint('Request URL: $url');
    debugPrint('Request Headers: $headers');
    debugPrint('Request Body: $body');

    final response = await http.post(url, headers: headers, body: body);

    debugPrint('Image response status code: ${response.statusCode}');
    debugPrint('Image response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint('Decoded image data: $data');
      return AIImage.fromMap(data);
    } else {
      debugPrint('Failed to generate image: ${response.statusCode}');
      throw Exception('Failed to generate image');
    }
  }

  String _buildImagePrompt(AISuperhero superhero) {
    return '''
      Create a photorealistic portrait of a superhero called ${superhero.name}, race: ${superhero.appearance!.race}. 
      No text, no words, no letters in the image, only one instance of a creature on a simple background!
    ''';
  }
}
