import 'package:flutter/material.dart';

class ThemeModel {
  final bool useMaterial3;
  final ThemeMode themeMode;

  ThemeModel(
    this.useMaterial3,
    this.themeMode,
  );

  ThemeModel copyWith({
    bool? useMaterial3,
    ThemeMode? themeMode,
  }) {
    return ThemeModel(
      useMaterial3 ?? this.useMaterial3,
      themeMode ?? this.themeMode,
    );
  }
}
