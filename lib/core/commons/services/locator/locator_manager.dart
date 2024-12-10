import 'package:get_it/get_it.dart';
import 'package:superheroes/core/commons/services/navigation/export_navigation.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';
import 'package:superheroes/features/playground/export_playground.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  _registerServices();
  _registerDataSources();
  _registerBlocs();

  await locator.allReady();
}

// // ============================== SERVICES ==============================

void _registerServices() {
  locator.registerLazySingleton(
    NavigationService.new,
  );
}

// // ============================== DATA SOURCES ==============================

void _registerDataSources() {
  locator
    ..registerFactory<SuperheroDatasource>(
      SuperheroDatasourceImpl.new,
    )
    ..registerFactory<PlaygroundDatasource>(
      PlaygroundDatasourceImpl.new,
    );
}

// // ============================== BLOCs ==============================

void _registerBlocs() {
  locator
    ..registerLazySingleton<NavigationBarBloc>(
      NavigationBarBloc.new,
    )
    ..registerSingleton<SuperheroesBloc>(
      SuperheroesBloc(
        locator<SuperheroDatasource>(),
      ),
    )
    ..registerLazySingleton<PlaygroundBloc>(
      () => PlaygroundBloc(
        locator<PlaygroundDatasource>(),
      ),
    );
}
