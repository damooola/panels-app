import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color.fromARGB(255, 222, 220, 220),
      primary: Colors.white,
      secondary: Color.fromARGB(255, 81, 81, 81),
      tertiary: Colors.red,
      inversePrimary: Colors.black,
    ));
