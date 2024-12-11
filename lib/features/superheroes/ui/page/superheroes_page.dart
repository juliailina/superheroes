import 'package:flutter/material.dart';
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
  final TextEditingController _searchController = TextEditingController();
  List<Superhero> _searchedSuperheroes = [];

  @override
  void initState() {
    super.initState();
    _superheroesBloc = locator<SuperheroesBloc>();
    _superheroesBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<ScreenState>(
        valueListenable: _superheroesBloc.screenState,
        builder: (context, screenState, child) {
          return _buildContent(screenState);
        },
      ),
    );
  }

  Widget _buildContent(ScreenState screenState) {
    switch (screenState) {
      case ScreenState.loading:
        return const Center(child: CircularProgressIndicator());
      case ScreenState.idle:
        return ValueListenableBuilder<List<Superhero>>(
          valueListenable: _superheroesBloc.superheroesNotifier,
          builder: (context, superheroes, child) {
            _searchedSuperheroes =
                _filterSuperheroes(superheroes, _searchController.text);
            return _buildSuperheroesList();
          },
        );
      case ScreenState.error:
      case ScreenState.empty:
        return const CustomErrorWidget();
    }
  }

  Widget _buildSuperheroesList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Spaces.spaceS,
        Spaces.spaceS,
        Spaces.spaceS,
        Spaces.zero,
      ),
      child: Column(
        children: [
          CustomSearchBar(
            controller: _searchController,
            onChanged: (keyword) {
              setState(() {
                _searchedSuperheroes = _filterSuperheroes(
                  _superheroesBloc.superheroes,
                  keyword,
                );
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchedSuperheroes.length,
              itemBuilder: (context, index) => SuperheroCard(
                key: ValueKey(_searchedSuperheroes[index].id),
                superhero: _searchedSuperheroes[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Superhero> _filterSuperheroes(
    List<Superhero> superheroes,
    String keyword,
  ) {
    if (keyword.isEmpty) {
      return superheroes;
    } else {
      return superheroes.where((superhero) {
        final nameMatch =
            superhero.name?.toLowerCase().contains(keyword.toLowerCase()) ??
                false;
        final raceMatch = superhero.appearance?.race
                ?.toLowerCase()
                .contains(keyword.toLowerCase()) ??
            false;
        return nameMatch || raceMatch;
      }).toList();
    }
  }
}
