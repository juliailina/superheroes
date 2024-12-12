import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';
import 'package:superheroes/core/extension/export_extensions.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
  static const double aspectRatio = 1;
  static const double shadowOpacity = 0.7;
  static const double shadowBlur = 20;
  static const double shadowSpread = 10;
  static const List<BoxShadow> cardShadows = [
    BoxShadow(
      color: CustomColors.foreground,
      blurRadius: 5,
      spreadRadius: 1,
    ),
  ];
  static const List<BoxShadow> textShadows = [
    BoxShadow(
      color: CustomColors.background,
      blurRadius: 10,
      spreadRadius: 5,
    ),
  ];
}

class SuperheroCard extends StatelessWidget {
  final Superhero superhero;

  const SuperheroCard({
    super.key,
    required this.superhero,
  });

  @override
  Widget build(BuildContext context) {
    final name = superhero.name?.capitalize() ?? '';
    final race = superhero.appearance?.race?.capitalize() ?? '';

    return GestureDetector(
      onTap: () => context.push(
        SuperheroRoutes.superheroDetail,
        extra: superhero,
      ),
      child: AspectRatio(
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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomSquareImage(image: superhero.images?.md ?? ''),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        Spaces.spaceXS,
                        Spaces.spaceXS,
                        Spaces.spaceXS,
                        Spaces.spaceS,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: _Constants.borderRadius,
                          bottomRight: _Constants.borderRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.background.withOpacity(
                              _Constants.shadowOpacity,
                            ),
                            blurRadius: _Constants.shadowBlur,
                            spreadRadius: _Constants.shadowSpread,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          race.isNotEmpty
                              ? Text(
                                  race,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        shadows: _Constants.textShadows,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: MaxLines.two,
                                )
                              : const SizedBox.shrink(),
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  shadows: _Constants.textShadows,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: MaxLines.two,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
