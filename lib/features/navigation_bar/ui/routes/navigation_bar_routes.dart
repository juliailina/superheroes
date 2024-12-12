import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';

class NavigationBarRoutes {
  NavigationBarRoutes._();

  static const navigationBar = '/navigationBar';

  static List<GoRoute> routes = [
    GoRoute(
      path: navigationBar,
      builder: _navigationBarRouteBuilder,
    ),
  ];

  static Widget _navigationBarRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const NavigationBarPage();
  }
}
