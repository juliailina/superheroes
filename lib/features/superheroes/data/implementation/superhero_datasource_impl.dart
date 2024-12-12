import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/superheroes/data/export_data.dart';

class SuperheroDatasourceImpl implements SuperheroDatasource {
  @override
  Future<Result<SuperheroesResponse>> getSuperheroes() async {
    try {
      final response = await http.get(Uri.parse(Endpoint.superheroes));
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson =
            json.decode(response.body) as List<dynamic>;
        return ResultSuccess(
          SuperheroesResponse.fromList(decodedJson),
        );
      } else {
        debugPrint('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e, stackTrace) {
      debugPrint('Exception: $e');
      return ResultError(e, stackTrace);
    }
  }
}
