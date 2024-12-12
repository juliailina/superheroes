import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/superheroes/data/export_data.dart';

abstract class SuperheroDatasource {
  Future<Result<SuperheroesResponse>> getSuperheroes();
}
