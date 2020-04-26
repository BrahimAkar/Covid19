import 'package:flutter/material.dart';

class ChangeTheme with ChangeNotifier {
  Color _color;
  ThemeData _theme;

  ChangeTheme(this._theme);

  getTheme() => _theme;
  setTheme(ThemeData themedata) {
    _theme = themedata;
  }

  getColor() => _color;
  setColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
