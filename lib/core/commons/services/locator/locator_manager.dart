import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superheroes/core/commons/services/navigation/export_navigation.dart';
import 'package:superheroes/core/commons/services/shared_preferences_service.dart';
import 'package:superheroes/features/generator/export_generator.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await _registerServices();
  _registerDataSources();
  _registerBlocs();

  await locator.allReady();
}

// // ============================== SERVICES ==============================

Future<void> _registerServices() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    ..registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService(sharedPreferences),
    )
    ..registerLazySingleton(
      NavigationService.new,
    );
}

// // ============================== DATA SOURCES ==============================

void _registerDataSources() {
  locator
    ..registerFactory<SuperheroDatasource>(
      SuperheroDatasourceImpl.new,
    )
    ..registerFactory<GeneratorDatasource>(
      GeneratorDatasourceImpl.new,
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
    ..registerLazySingleton<GeneratorBloc>(
      () => GeneratorBloc(
        locator<GeneratorDatasource>(),
      ),
    );
}
