import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/services/export_services.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/features/superheroes/domain/export_domain.dart';

class SuperheroDetailPage extends StatefulWidget {
  final Superhero superhero;

  const SuperheroDetailPage({
    super.key,
    required this.superhero,
  });

  @override
  State<SuperheroDetailPage> createState() => _SuperheroDetailPageState();
}

class _SuperheroDetailPageState extends State<SuperheroDetailPage> {
  late final SuperheroesBloc _superheroesBloc;

  @override
  void initState() {
    super.initState();
    _superheroesBloc = locator<SuperheroesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.secondary,
      body: Placeholder(),
    );
  }
}
