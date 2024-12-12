import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/services/translation/export_translation.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';
import 'package:superheroes/core/extension/export_extensions.dart';
import 'package:superheroes/features/superheroes/domain/export_domain.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
  static const double aspectRatio = 1;
  static const List<BoxShadow> cardShadows = [
    BoxShadow(
      color: CustomColors.foreground,
      blurRadius: 5,
      spreadRadius: 1,
    ),
  ];
}

class SuperheroDetailPage extends StatelessWidget {
  final Superhero superhero;

  const SuperheroDetailPage({
    super.key,
    required this.superhero,
  });

  @override
  Widget build(BuildContext context) {
    final name = superhero.name?.capitalize() ?? S.of(context).superhero;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Spaces.spaceM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              Spaces.verticalM(),
              _buildInfo(context, name),
              Spaces.verticalM(),
              _buildStats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    final image = superhero.images?.lg;

    return AspectRatio(
      aspectRatio: _Constants.aspectRatio,
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: CustomColors.background,
            borderRadius: BorderRadius.all(
              _Constants.borderRadius,
            ),
            boxShadow: _Constants.cardShadows,
          ),
          child: CustomSquareImage(image: image ?? ''),
        ),
      ),
    );
  }

  Column _buildInfo(BuildContext context, String name) {
    final race = superhero.appearance?.race;
    final gender = superhero.appearance?.gender;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoLineWidget(param: name, label: S.of(context).nameLabel),
        if (race != null)
          InfoLineWidget(param: race, label: S.of(context).raceLabel),
        if (gender != null)
          InfoLineWidget(param: gender, label: S.of(context).genderLabel),
      ],
    );
  }

  Widget _buildStats() {
    final stats = superhero.powerstats;

    return StatsGridWidget(
      intelligence: stats?.intelligence,
      strength: stats?.strength,
      speed: stats?.speed,
      durability: stats?.durability,
      power: stats?.power,
      combat: stats?.combat,
    );
  }
}
