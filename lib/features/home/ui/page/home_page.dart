import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/services/export_services.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SuperheroesBloc _superheroesBloc;

  @override
  void initState() {
    super.initState();
    _superheroesBloc = locator<SuperheroesBloc>();
  }

  void _navigateTo({
    required BuildContext context,
    required String route,
  }) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final list = _superheroesBloc.superheroes;
    final random = Random();

    return ValueListenableBuilder(
      valueListenable: _superheroesBloc.screenState,
      builder: (context, screenState, child) {
        return Scaffold(
          backgroundColor: CustomColors.secondary,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(Spaces.spaceS),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).homePageTitle),
                    Spaces.verticalS(),
                    _superheroCard(list[random.nextInt(list.length)]),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _superheroCard(Superhero superhero) {
    final image = superhero.images?.sm;
    final name = superhero.name;
    final race = superhero.appearance?.race;

    return GestureDetector(
      onTap: () => context.push(
        SuperheroRoutes.superheroDetail,
        extra: superhero,
      ),
      child: SuperheroListTile(
        imageUrl: image,
        name: name,
        race: race,
      ),
    );
  }
}
