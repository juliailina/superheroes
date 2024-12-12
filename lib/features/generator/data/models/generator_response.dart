import 'package:superheroes/features/generator/domain/models/export_models.dart';

class GeneratorResponse {
  final AISuperhero superhero;
  final AIImage image;

  GeneratorResponse({
    required this.superhero,
    required this.image,
  });
}
