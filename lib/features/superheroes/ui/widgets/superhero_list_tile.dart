import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
  static const double height = 130;
  static const int photoFlex = 3;
  static const int infoSectionFlex = 5;
  static const int gridRowCount = 3;
  static const double gridAspectRatio = 3;
}

class SuperheroListTile extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final String? race;
  final int? intelligence;
  final int? strength;
  final int? speed;
  final int? durability;
  final int? power;
  final int? combat;

  const SuperheroListTile({
    super.key,
    required this.imageUrl,
    required this.name,
    this.race,
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  @override
  State<SuperheroListTile> createState() => _SuperheroListTileState();
}

class _SuperheroListTileState extends State<SuperheroListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              _buildInfoSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _placeholderImageWidget => Assets.placeholder.svg(
        fit: BoxFit.cover,
      );

  Widget get _imageWidget {
    final imageUrl = widget.imageUrl;

    if (imageUrl?.trim().isEmpty ?? true) {
      return SizedBox(
        height: _Constants.height,
        child: _placeholderImageWidget,
      );
    }

    return CachedNetworkImage(
      height: _Constants.height,
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      placeholder: (context, url) => Assets.placeholder.svg(
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Assets.placeholder.svg(
        fit: BoxFit.cover,
      ),
    );
  }

  Expanded _buildImage() {
    return Expanded(
      flex: _Constants.photoFlex,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: _Constants.borderRadius,
          bottomLeft: _Constants.borderRadius,
        ),
        child: _imageWidget,
      ),
    );
  }

  Expanded _buildInfoSection(BuildContext context) {
    return Expanded(
      flex: _Constants.infoSectionFlex,
      child: Padding(
        padding: const EdgeInsets.all(
          Spaces.spaceS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.name?.trim().isNotEmpty ?? false)
              Flexible(
                child: Text(
                  widget.name!.toUpperCase(),
                  style: CustomTextStyle.titleS,
                  overflow: TextOverflow.ellipsis,
                  maxLines: MaxLines.two,
                ),
              ),
            if (widget.race?.trim().isNotEmpty ?? false)
              Flexible(
                child: Text(
                  widget.race!.toUpperCase(),
                  style: CustomTextStyle.titleXS,
                  overflow: TextOverflow.ellipsis,
                  maxLines: MaxLines.two,
                ),
              ),
            _buildIconsGrid(context),
          ],
        ),
      ),
    );
  }

  Flexible _buildIconsGrid(BuildContext context) {
    final Map<String, int?> stats = {
      '🧠': widget.intelligence,
      '💪': widget.strength,
      '🏃': widget.speed,
      '✊': widget.durability,
      '⚡': widget.power,
      '🥷': widget.combat,
    };

    final statsEntries = stats.entries.toList();

    return Flexible(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _Constants.gridRowCount,
          childAspectRatio: _Constants.gridAspectRatio,
          mainAxisSpacing: Spaces.spaceXXS,
        ),
        itemCount: statsEntries.length,
        itemBuilder: (BuildContext context, index) {
          final entry = statsEntries[index];
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
              Text(
                icon,
              ),
              Spaces.horizontalXS(),
              Text(
                '$value',
                style: const TextStyle(
                  color: CustomColors.black,
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
