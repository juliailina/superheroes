import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/generator/domain/models/export_models.dart';
import 'package:superheroes/features/generator/export_generator.dart';

class MockGeneratorDatasource extends Mock implements GeneratorDatasource {}

void main() {
  late GeneratorBloc generatorBloc;
  late MockGeneratorDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockGeneratorDatasource();
    generatorBloc = GeneratorBloc(mockDatasource);
  });

  test('Initial state should be ScreenState.empty', () {
    expect(generatorBloc.screenState.value, ScreenState.empty);
  });

  test(
      'GeneratorBloc emits ScreenState.loading and then ScreenState.idle on success',
      () async {
    final expectedResponse = GeneratorResponse(
      superhero: AISuperhero(name: 'Superhero'),
      image: AIImage(imageUrl: 'url'),
    );

    when(mockDatasource.generateSuperhero())
        .thenAnswer((_) async => ResultSuccess(expectedResponse));

    await generatorBloc.generateSuperhero();

    expect(generatorBloc.screenState.value, ScreenState.loading);

    await Future.delayed(Duration.zero);

    expect(generatorBloc.screenState.value, ScreenState.idle);
  });

  test('GeneratorBloc emits ScreenState.error on failure', () async {
    const error = 'Error generating superhero';

    when(mockDatasource.generateSuperhero()).thenAnswer(
      (_) async => ResultError(
        error,
        StackTrace.current,
      ),
    );

    await generatorBloc.generateSuperhero();

    expect(generatorBloc.screenState.value, ScreenState.loading);

    await Future.delayed(Duration.zero);

    expect(generatorBloc.screenState.value, ScreenState.error);
  });
}
