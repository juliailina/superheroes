import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/playground/export_playground.dart';

class PlaygroundRoutes {
  PlaygroundRoutes._();

  // Paths
  static const playground = '/playground';

  // Routes Builder
  static Widget _playgroundRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PlaygroundPage();
  }

  // Routes
  static List<GoRoute> routes = [
    GoRoute(
      path: playground,
      builder: _playgroundRouteBuilder,
    ),
  ];
}
