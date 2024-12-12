import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/home/ui/page/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static Widget _homeRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const HomePage();
  }

  static List<GoRoute> routes = [
    GoRoute(
      path: home,
      builder: _homeRouteBuilder,
    ),
  ];
}
