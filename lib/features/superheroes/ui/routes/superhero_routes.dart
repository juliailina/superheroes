import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class SuperheroRoutes {
  SuperheroRoutes._();

  // Paths
  static const superheroes = '/superheroes';
  static const superheroDetail = '/superheroes/superhero_detail';

  // Routes Builder
  static Widget _superheroesRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SuperheroesPage();
  }

  static Widget _superheroDetailRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return SuperheroDetailPage(
      superhero: state.extra! as Superhero,
    );
  }

  // Routes
  static List<GoRoute> routes = [
    GoRoute(
      path: superheroes,
      builder: _superheroesRouteBuilder,
    ),
    GoRoute(
      path: superheroDetail,
      builder: _superheroDetailRouteBuilder,
    ),
  ];
}
