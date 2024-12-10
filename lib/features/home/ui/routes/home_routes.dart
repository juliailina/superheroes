import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/home/ui/page/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  // Paths
  static const home = '/home';

  // Routes Builder
  static Widget _homeRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomePage();
  }

  // Routes
  static List<GoRoute> routes = [
    GoRoute(
      path: home,
      builder: _homeRouteBuilder,
    ),
  ];
}
