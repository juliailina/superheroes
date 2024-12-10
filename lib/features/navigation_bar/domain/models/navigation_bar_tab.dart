import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/services/translation/export_translation.dart';

enum NavigationBarTab {
  home,
  superheroes,
  playground;

  bool get isHome => this == home;
  bool get isSuperheroes => this == superheroes;
  bool get isPlayground => this == playground;

  String appBarTitle(BuildContext context) => switch (this) {
        NavigationBarTab.home => S.of(context).homeLabel,
        NavigationBarTab.superheroes => S.of(context).superheroesLabel,
        NavigationBarTab.playground => S.of(context).playgroundLabel,
      };
}
