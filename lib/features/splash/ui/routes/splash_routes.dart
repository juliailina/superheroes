import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/splash/ui/page/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  // Paths
  static const splash = '/';

  // Routes Builder
  static Widget _splashRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SplashPage();
  }

  // Routes
  static List<GoRoute> routes = [
    GoRoute(
      path: splash,
      builder: _splashRouteBuilder,
    ),
  ];
}
