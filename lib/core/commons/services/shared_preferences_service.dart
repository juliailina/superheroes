import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static String firstTimeOpenApp = 'firstTimeOpenApp';
}

class SharedPreferencesService {
  SharedPreferencesService(this._preferences);

  final SharedPreferences _preferences;

  //final SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isFirstTimeOpenApp() =>
      _preferences.getBool(_Keys.firstTimeOpenApp) ?? true;

  void setIsFirstTimeOpenApp(bool isFirstTime) =>
      _preferences.setBool(_Keys.firstTimeOpenApp, isFirstTime);
}
