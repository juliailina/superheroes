import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/data/export_data.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

void main() {
  late SuperheroesBloc superheroesBloc;
  late MockSuperheroDatasource mockSuperheroDatasource;

  setUp(() {
    mockSuperheroDatasource = MockSuperheroDatasource();
    superheroesBloc = SuperheroesBloc(mockSuperheroDatasource);
  });

  test('Initial state should be ScreenState.idle', () {
    expect(superheroesBloc.screenState.value, ScreenState.idle);
  });

  test('Get superheroes sets screenState to loading then idle on success',
      () async {
    final superheroes = [Superhero(id: 1)];
    when(mockSuperheroDatasource.getSuperheroes()).thenAnswer(
      (_) async => ResultSuccess(SuperheroesResponse(superheroes: superheroes)),
    );

    await superheroesBloc.init();

    expect(superheroesBloc.screenState.value, ScreenState.loading);
    expect(superheroesBloc.screenState.value, ScreenState.idle);
  });

  test('Get superheroes sets screenState to error on failure', () async {
    const error = 'Error getting superheroes list';

    when(mockSuperheroDatasource.getSuperheroes()).thenAnswer(
      (_) async => ResultError(error, StackTrace.current),
    );

    await superheroesBloc.init();

    expect(superheroesBloc.screenState.value, ScreenState.loading);
    expect(superheroesBloc.screenState.value, ScreenState.error);
  });
}

class MockSuperheroDatasource extends Mock implements SuperheroDatasource {}
