import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class GeneratorRoutes {
  GeneratorRoutes._();

  static const generator = '/generator';

  static Widget _generatorRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const GeneratorPage();
  }

  static List<GoRoute> routes = [
    GoRoute(
      path: generator,
      builder: _generatorRouteBuilder,
    ),
  ];
}
