import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/generator/export_generator.dart';

abstract class GeneratorDatasource {
  Future<Result<GeneratorResponse>> generateSuperhero();
}
