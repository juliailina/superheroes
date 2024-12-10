import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/commons/services/export_services.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/commons/ui/widgets/custom_error_widget.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class SuperheroesPage extends StatefulWidget {
  const SuperheroesPage({super.key});

  @override
  State<SuperheroesPage> createState() => _SuperheroesPageState();
}

class _SuperheroesPageState extends State<SuperheroesPage> {
  late final SuperheroesBloc _superheroesBloc;

  @override
  void initState() {
    super.initState();
    _superheroesBloc = locator<SuperheroesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _superheroesBloc.screenState,
      builder: (context, screenState, child) {
        return Scaffold(
          body: _buildContent(
            screenState: screenState,
          ),
        );
      },
    );
  }

  Widget _buildContent({
    required ScreenState screenState,
  }) {
    switch (screenState) {
      case ScreenState.loading:
        return const CircularProgressIndicator();
      case ScreenState.idle:
        return _buildSuperheroes(context);
      case ScreenState.error:
        return const CustomErrorWidget();
      case ScreenState.empty:
        return const CustomErrorWidget();
    }
  }

  Widget _buildSuperheroes(BuildContext context) {
    final list = _superheroesBloc.superheroes;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Spaces.spaceS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list.map(_superheroCard).toList(),
        ),
      ),
    );
  }

  Widget _superheroCard(Superhero superhero) {
    final image = superhero.images?.sm;
    final name = superhero.name;
    final race = superhero.appearance?.race;
    final intelligence = superhero.powerstats?.intelligence;
    final strength = superhero.powerstats?.strength;
    final speed = superhero.powerstats?.speed;
    final durability = superhero.powerstats?.durability;
    final power = superhero.powerstats?.power;
    final combat = superhero.powerstats?.combat;

    return GestureDetector(
      onTap: () => context.push(
        SuperheroRoutes.superheroDetail,
        extra: superhero,
      ),
      child: SuperheroListTile(
        imageUrl: image,
        name: name,
        race: race,
        intelligence: intelligence,
        strength: strength,
        speed: speed,
        durability: durability,
        power: power,
        combat: combat,
      ),
    );
  }
}
