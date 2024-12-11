import 'dart:math';
import 'package:flutter/material.dart';
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
  late final SharedPreferencesService _sharedPreferencesService;
  Superhero? superheroOfTheDay;

  @override
  void initState() {
    super.initState();
    _superheroesBloc = locator<SuperheroesBloc>();
    _sharedPreferencesService = locator<SharedPreferencesService>();
    _initializeSuperheroOfTheDay();
  }

  Future<void> _initializeSuperheroOfTheDay() async {
    final list = _superheroesBloc.superheroes;

    if (_sharedPreferencesService.shouldUpdateSuperheroOfTheDay()) {
      final random = Random();
      final superhero = list[random.nextInt(list.length)];

      await _sharedPreferencesService.setSuperheroOfTheDay(
        superhero.id?.toString() ?? '',
        DateTime.now().toIso8601String(),
      );

      setState(() {
        superheroOfTheDay = superhero;
      });
    } else {
      final superheroId = _sharedPreferencesService.getSuperheroOfTheDayId();
      if (superheroId != null) {
        final superhero =
            list.firstWhere((s) => s.id.toString() == superheroId);
        setState(() {
          superheroOfTheDay = superhero;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    if (superheroOfTheDay != null)
                      SuperheroCard(
                        superhero: superheroOfTheDay!,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
