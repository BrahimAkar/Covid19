import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF243953),
  primaryColor: Color(0xFF243953),
  fontFamily: 'Questv',
  primarySwatch: Colors.red,
  accentColor: Colors.white,
);

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Questv',
);

class ThemeNotifier extends ChangeNotifier {
  final String keyPrefs = "theme";
  SharedPreferences prefs;
  bool _isDark;

  bool get isDark => _isDark;

  ThemeNotifier() {
    _isDark = true;
    _loadFromPrefs();
  }
  toggleTheme() {
    _isDark = !_isDark;
    _saveToPrefs();
    notifyListeners();
  }

  intiatePrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await intiatePrefs();
    _isDark = prefs.getBool(keyPrefs) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await intiatePrefs();
    prefs.setBool(keyPrefs, _isDark);
  }
}
