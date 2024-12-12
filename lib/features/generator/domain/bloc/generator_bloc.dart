import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class GeneratorBloc {
  final GeneratorDatasource _generatorDatasource;
  GeneratorBloc(this._generatorDatasource);

  final ValueNotifier<ScreenState> _screenState =
      ValueNotifier(ScreenState.empty);
  final ValueNotifier<GeneratorResponse?> _generatorResponse =
      ValueNotifier(null);

  ValueNotifier<ScreenState> get screenState => _screenState;
  ValueNotifier<GeneratorResponse?> get generatorResponseNotifier =>
      _generatorResponse;

  Future<void> generateSuperhero() async {
    debugPrint('Generating superhero...');
    _screenState.value = ScreenState.loading;

    final result = await _generatorDatasource.generateSuperhero();
    debugPrint('Result received: $result');
    result.whenWithResult(
      (success) {
        debugPrint('Success: ${success.value}');
        _generatorResponse.value = success.value;
        _screenState.value = ScreenState.idle;
      },
      (error) {
        debugPrint('Error: ${error.error}');
        _generatorResponse.value = null;
        _screenState.value = ScreenState.error;
      },
    );
  }
}
