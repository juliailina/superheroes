import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/commons/services/locator/locator_manager.dart';
import 'package:superheroes/core/commons/services/translation/export_translation.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';
import 'package:superheroes/features/generator/domain/models/export_models.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
  static const double aspectRatio = 1;
  static const double shadowBlur = 20;
  static const double buttonElevation = 2;
  static const List<BoxShadow> imageShadows = [
    BoxShadow(
      color: CustomColors.foreground,
      blurRadius: 5,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: CustomColors.orangeAccent,
      blurRadius: _Constants.shadowBlur,
    ),
  ];
}

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  late GeneratorBloc _generatorBloc;

  @override
  void initState() {
    super.initState();
    _generatorBloc = locator<GeneratorBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<ScreenState>(
        valueListenable: _generatorBloc.screenState,
        builder: (context, screenState, child) {
          return _buildContent(screenState);
        },
      ),
    );
  }

  Widget _buildContent(ScreenState screenState) {
    switch (screenState) {
      case ScreenState.loading:
        return Center(
          child: Assets.lottie.loading.lottie(
            fit: BoxFit.contain,
          ),
        );
      case ScreenState.idle:
        return SingleChildScrollView(
          child: ValueListenableBuilder<GeneratorResponse?>(
            valueListenable: _generatorBloc.generatorResponseNotifier,
            builder: (context, generatorResponse, child) {
              if (generatorResponse != null) {
                final superhero = generatorResponse.superhero;
                final image = generatorResponse.image;
                return _buildSuperhero(superhero, image);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      case ScreenState.error:
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomErrorWidget(),
              ElevatedButton(
                onPressed: () {
                  _generatorBloc.generateSuperhero();
                },
                child: Text(S.of(context).tryAgainButton),
              ),
            ],
          ),
        );
      case ScreenState.empty:
        return Center(child: _buildButton(S.of(context).generateButton));
    }
  }

  Widget _buildSuperhero(AISuperhero superhero, AIImage image) {
    return Padding(
      padding: const EdgeInsets.all(Spaces.spaceS),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image.imageUrl != null) _buildImage(image),
              Spaces.verticalS(),
              if (superhero.name != null)
                Text(
                  '${superhero.name}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              Spaces.verticalS(),
              if (superhero.biography != null) Text('${superhero.biography}'),
              Spaces.verticalS(),
              if (superhero.appearance != null) _buildInfo(superhero),
              Spaces.verticalS(),
              if (superhero.powerstats != null) _buildStats(superhero),
            ],
          ),
          Spaces.verticalM(),
          _buildButton(S.of(context).generateButton),
        ],
      ),
    );
  }

  Widget _buildImage(AIImage image) {
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
            boxShadow: _Constants.imageShadows,
          ),
          child: CustomSquareImage(image: image.imageUrl ?? ''),
        ),
      ),
    );
  }

  Column _buildInfo(AISuperhero superhero) {
    final race = superhero.appearance?.race;
    final height = superhero.appearance?.height;
    final weight = superhero.appearance?.weight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (race != null)
          InfoLineWidget(param: race, label: S.of(context).raceLabel),
        if (height != null)
          InfoLineWidget(param: height, label: S.of(context).heightLabel),
        if (weight != null)
          InfoLineWidget(param: weight, label: S.of(context).weightLabel),
      ],
    );
  }

  Widget _buildStats(AISuperhero superhero) {
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

  Widget _buildButton(String label) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(CustomColors.foreground),
        backgroundColor: WidgetStateProperty.all(CustomColors.purpleAccent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: Spaces.spaceS,
            horizontal: Spaces.spaceL,
          ),
        ),
        elevation: WidgetStateProperty.all(_Constants.buttonElevation),
        textStyle:
            WidgetStateProperty.all(Theme.of(context).textTheme.titleMedium),
      ),
      onPressed: () {
        _generatorBloc.generateSuperhero();
      },
      child: Text(label),
    );
  }
}
