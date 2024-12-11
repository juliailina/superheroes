import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/extension/export_extensions.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
  static const double height = 175;
  static const int photoFlex = 3;
  static const int infoSectionFlex = 5;
  static const int gridRowCount = 3;
  static const double gridAspectRatio = 3;
}

class SuperheroCard extends StatelessWidget {
  final Superhero superhero;

  const SuperheroCard({
    super.key,
    required this.superhero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        SuperheroRoutes.superheroDetail,
        extra: superhero,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Spaces.spaceXS),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(_Constants.borderRadius),
          ),
          child: Container(
            constraints: const BoxConstraints(maxHeight: _Constants.height),
            child: Row(
              children: [
                _buildImage(),
                _buildInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _placeholderImageWidget => Assets.placeholder.svg(
        fit: BoxFit.cover,
      );

  Widget _buildImage() {
    return Expanded(
      flex: _Constants.photoFlex,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: _Constants.borderRadius,
          bottomLeft: _Constants.borderRadius,
        ),
        child: CachedNetworkImage(
          height: _Constants.height,
          imageUrl: superhero.images?.sm ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => _placeholderImageWidget,
          errorWidget: (context, url, error) => _placeholderImageWidget,
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    final name = superhero.name?.capitalize() ?? '';
    final race = superhero.appearance?.race?.capitalize() ?? '';

    return Expanded(
      flex: _Constants.infoSectionFlex,
      child: Padding(
        padding: const EdgeInsets.all(Spaces.spaceS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNameAndRace(name, race),
            _buildIconsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameAndRace(String name, String race) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name.isNotEmpty)
          Text(
            name,
            style: CustomTextStyle.titleS,
            overflow: TextOverflow.ellipsis,
            maxLines: MaxLines.two,
          ),
        if (race.isNotEmpty)
          Chip(
            label: Text(
              race,
              style: CustomTextStyle.paragraphMbold,
              overflow: TextOverflow.ellipsis,
              maxLines: MaxLines.two,
            ),
          ),
      ],
    );
  }

  Widget _buildIconsGrid() {
    final stats = {
      '🧠': superhero.powerstats?.intelligence,
      '💪': superhero.powerstats?.strength,
      '🏃': superhero.powerstats?.speed,
      '✊': superhero.powerstats?.durability,
      '⚡': superhero.powerstats?.power,
      '🥷': superhero.powerstats?.combat,
    };

    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _Constants.gridRowCount,
          childAspectRatio: _Constants.gridAspectRatio,
          mainAxisSpacing: Spaces.spaceXXS,
        ),
        itemCount: stats.length,
        itemBuilder: (BuildContext context, index) {
          final entry = stats.entries.toList()[index];
          return _IconWidget(
            icon: entry.key,
            value: entry.value,
          );
        },
      ),
    );
  }
}

class _IconWidget extends StatelessWidget {
  final String icon;
  final int? value;

  const _IconWidget({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return value != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(icon),
              Spaces.horizontalXS(),
              Text('$value'),
            ],
          )
        : const SizedBox.shrink();
  }
}
