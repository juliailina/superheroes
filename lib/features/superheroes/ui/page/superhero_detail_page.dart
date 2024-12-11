import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/extension/export_extensions.dart';
import 'package:superheroes/features/superheroes/domain/export_domain.dart';

class SuperheroDetailPage extends StatelessWidget {
  final Superhero superhero;

  const SuperheroDetailPage({
    super.key,
    required this.superhero,
  });

  @override
  Widget build(BuildContext context) {
    final name = superhero.name?.capitalize() ?? 'Unknown Hero';
    final image = superhero.images?.lg ?? '';
    final race = superhero.appearance?.race ?? 'Unknown Race';
    final gender = superhero.appearance?.gender ?? 'Unknown Gender';
    final intelligence = superhero.powerstats?.intelligence ?? 0;
    final strength = superhero.powerstats?.strength ?? 0;
    final speed = superhero.powerstats?.speed ?? 0;
    final durability = superhero.powerstats?.durability ?? 0;
    final power = superhero.powerstats?.power ?? 0;
    final combat = superhero.powerstats?.combat ?? 0;

    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: CustomColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Spaces.spaceS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(image),
              const SizedBox(height: Spaces.spaceM),
              _buildBasicInfo(name, race, gender),
              const SizedBox(height: Spaces.spaceM),
              _buildStats(
                intelligence,
                strength,
                speed,
                durability,
                power,
                combat,
              ),
              const SizedBox(height: Spaces.spaceM),
              // TODO: update ui, add biography
              //_buildBiography(superhero.biography),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 250,
        width: 250,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Assets.placeholder.svg(fit: BoxFit.cover),
        errorWidget: (context, url, error) =>
            Assets.placeholder.svg(fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildBasicInfo(String name, String race, String gender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name: $name',
          style: CustomTextStyle.titleM,
        ),
        const SizedBox(height: Spaces.spaceXS),
        Text(
          'Race: $race',
          style: CustomTextStyle.paragraphMdefault,
        ),
        const SizedBox(height: Spaces.spaceXS),
        Text(
          'Gender: $gender',
          style: CustomTextStyle.paragraphMdefault,
        ),
      ],
    );
  }

  Widget _buildStats(
    int intelligence,
    int strength,
    int speed,
    int durability,
    int power,
    int combat,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stats:',
          style: CustomTextStyle.titleXS,
        ),
        const SizedBox(height: Spaces.spaceXS),
        _buildStatRow('🧠 Intelligence', intelligence),
        _buildStatRow('💪 Strength', strength),
        _buildStatRow('🏃 Speed', speed),
        _buildStatRow('✊ Durability', durability),
        _buildStatRow('⚡ Power', power),
        _buildStatRow('🥷 Combat', combat),
      ],
    );
  }

  Widget _buildStatRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spaces.spaceXS),
      child: Row(
        children: [
          Text(label, style: CustomTextStyle.paragraphMdefault),
          const SizedBox(width: 8),
          Text('$value', style: CustomTextStyle.paragraphMbold),
        ],
      ),
    );
  }

  Widget _buildBiography(String? biography) {
    return biography != null && biography.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Biography:',
                style: CustomTextStyle.titleXS,
              ),
              const SizedBox(height: Spaces.spaceXS),
              Text(
                biography,
                style: CustomTextStyle.paragraphMdefault,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
