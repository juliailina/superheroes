import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/splash/ui/page/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  static const splash = '/';

  static Widget _splashRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SplashPage();
  }

  static List<GoRoute> routes = [
    GoRoute(
      path: splash,
      builder: _splashRouteBuilder,
    ),
  ];
}
