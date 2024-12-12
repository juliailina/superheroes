import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class SuperheroesBloc {
  final SuperheroDatasource _superheroDatasource;
  SuperheroesBloc(this._superheroDatasource);

  final ValueNotifier<ScreenState> _screenState =
      ValueNotifier(ScreenState.idle);
  final ValueNotifier<List<Superhero>> _superheroes = ValueNotifier([]);

  List<Superhero> get superheroes => _superheroes.value;
  ValueNotifier<List<Superhero>> get superheroesNotifier => _superheroes;
  ValueNotifier<ScreenState> get screenState => _screenState;

  Future<void> init() async {
    await _getSuperheroes();
  }

  Future<void> _getSuperheroes() async {
    _screenState.value = ScreenState.loading;
    final result = await _superheroDatasource.getSuperheroes();

    result.whenWithResult(
      (success) {
        _superheroes.value = success.value.superheroes;
        _screenState.value = ScreenState.idle;
      },
      (error) {
        _superheroes.value = [];
        _screenState.value = ScreenState.error;
      },
    );
  }
}
