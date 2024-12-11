import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/commons/services/locator/locator_manager.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/core/commons/ui/widgets/custom_error_widget.dart';
import 'package:superheroes/features/generator/domain/models/export_models.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class _Constants {
  static const double borderRadius = 25;
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
    _generatorBloc.init();
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
        return const Center(child: CircularProgressIndicator());
      case ScreenState.idle:
        return ValueListenableBuilder<GeneratorResponse?>(
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
        );
      case ScreenState.error:
      case ScreenState.empty:
        return const CustomErrorWidget();
    }
  }

  Widget _buildSuperhero(AISuperhero superhero, AIImage image) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Spaces.spaceS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      _Constants.borderRadius,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image.imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Assets.placeholder.svg(fit: BoxFit.cover),
                      errorWidget: (context, url, error) =>
                          Assets.placeholder.svg(fit: BoxFit.cover),
                    ),
                  ),
                Spaces.verticalS(),
                if (superhero.name != null) Text('${superhero.name}'),
                Spaces.verticalS(),
                if (superhero.biography != null) Text('${superhero.biography}'),
                Spaces.verticalS(),
                if (superhero.appearance != null) ...[
                  Text("Race: ${superhero.appearance?.race ?? 'N/A'}"),
                  Text("Height: ${superhero.appearance?.height ?? 'N/A'}"),
                  Text("Weight: ${superhero.appearance?.weight ?? 'N/A'}"),
                ],
                Spaces.verticalS(),
                if (superhero.powerstats != null) ...[
                  Text(
                    "Intelligence: ${superhero.powerstats?.intelligence ?? 'N/A'}",
                  ),
                  Text("Strength: ${superhero.powerstats?.strength ?? 'N/A'}"),
                  Text("Speed: ${superhero.powerstats?.speed ?? 'N/A'}"),
                  Text(
                    "Durability: ${superhero.powerstats?.durability ?? 'N/A'}",
                  ),
                  Text("Power: ${superhero.powerstats?.power ?? 'N/A'}"),
                  Text("Combat: ${superhero.powerstats?.combat ?? 'N/A'}"),
                ],
              ],
            ),
            Spaces.verticalM(),
            ElevatedButton(
              onPressed: () {
                _generatorBloc.generateSuperhero();
              },
              child: const Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
