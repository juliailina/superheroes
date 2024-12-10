import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/services/locator/locator_manager.dart';
import 'package:superheroes/core/commons/services/navigation/export_navigation.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';
import 'package:superheroes/features/home/export_home.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';
import 'package:superheroes/features/playground/export_playground.dart';
import 'package:superheroes/features/splash/export_splash.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class AppRouter {
  static GoRouter get router => _router;

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const CustomErrorWidget();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: locator<NavigationService>().navigationKey,
    routes: <GoRoute>[
      ...SplashRoutes.routes,
      ...NavigationBarRoutes.routes,
      ...SuperheroRoutes.routes,
      ...HomeRoutes.routes,
      ...PlaygroundRoutes.routes,
    ],
    errorBuilder: errorWidget,
  );
}
