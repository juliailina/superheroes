import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class SuperheroesBloc {
  final SuperheroDatasource _superheroDatasource;
  SuperheroesBloc(this._superheroDatasource);

  final ValueNotifier<ScreenState> _screenState =
      ValueNotifier(ScreenState.idle);
  List<Superhero> _superheroes = [];

  ValueNotifier<ScreenState> get screenState => _screenState;
  List<Superhero> get superheroes => _superheroes;

  Future<void> init() async {
    await _getSuperheroes();
  }

  Future<void> _getSuperheroes() async {
    _screenState.value = ScreenState.loading;

    final result = await _superheroDatasource.getSuperheroes();

    result.whenWithResult(
      (success) {
        _superheroes = success.value.superheroes;
      },
      (error) {
        debugPrint('Error getSuperheroes : ${error.error}');
        _superheroes = [];
      },
    );
    _screenState.value = ScreenState.idle;

    debugPrint('Superheroes: ${_superheroes.length}');
  }
}
