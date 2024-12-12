import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static String superheroOfTheDayDate = 'superheroOfTheDayDate';
  static String superheroOfTheDayId = 'superheroOfTheDayId';
}

class SharedPreferencesService {
  SharedPreferencesService(this._preferences);

  final SharedPreferences _preferences;

  Future<void> setSuperheroOfTheDay(String superheroId, String date) async {
    await _preferences.setString(_Keys.superheroOfTheDayId, superheroId);
    await _preferences.setString(_Keys.superheroOfTheDayDate, date);
  }

  String? getSuperheroOfTheDayId() =>
      _preferences.getString(_Keys.superheroOfTheDayId);

  String? getSuperheroOfTheDayDate() =>
      _preferences.getString(_Keys.superheroOfTheDayDate);

  bool shouldUpdateSuperheroOfTheDay() {
    final storedDate = _preferences.getString(_Keys.superheroOfTheDayDate);
    if (storedDate == null) {
      return true;
    }

    final currentDate = DateTime.now();
    final storedDateTime = DateTime.parse(storedDate);
    final difference = currentDate.difference(storedDateTime).inHours;

    return difference >= 24;
  }
}
