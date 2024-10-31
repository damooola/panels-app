import 'package:flutter/material.dart';
import 'package:panels_app/theme/dark_mode.dart';
import 'package:panels_app/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void switchtoDarkTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    }
  }

  void switchtoLightTheme() {
    if (_themeData == darkMode) {
      themeData = lightMode;
    }
  }
}
