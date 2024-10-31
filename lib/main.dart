import 'package:flutter/material.dart';
import 'package:panels_app/screens/holder_screen.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HolderScreen(),
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
    );
  }
}
