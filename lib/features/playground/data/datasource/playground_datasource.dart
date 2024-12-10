import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/playground/export_playground.dart';

abstract class PlaygroundDatasource {
  Future<Result<PlaygroundResponse>> getPlayground();
}
