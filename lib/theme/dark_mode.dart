import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 44, 43, 43),
    primary: Colors.black,
    secondary: Color.fromARGB(255, 161, 156, 156),
    tertiary: Colors.red,
    inversePrimary: Colors.white,
  ),
);
