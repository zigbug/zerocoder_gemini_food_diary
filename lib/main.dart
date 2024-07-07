import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: _themeData(context),
      home: const LoginPage(),
    );
  }
}

ThemeData _themeData(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8FDA97), // Your first color
        brightness: Brightness.light,
        primary: const Color(0xFF420B56), // Your second color
        onPrimary: Colors.white,
        secondary: const Color(0xFF8FDA97),
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: const Color(0xFF420B56),
        onBackground: Colors.white,
        surface: const Color(0xFF8FDA97),
        onSurface: Colors.black,
      ),
      useMaterial3: true,
      // Modern approach for text styles
      textTheme: Typography.blackMountainView.copyWith(
        labelSmall: const TextStyle(color: Colors.white),
        // Customize button text style
        // button: const TextStyle(color: Colors.white),
        // Customize body text styles
        bodyLarge: const TextStyle(color: Colors.white),
        bodyMedium: const TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF420B56)),
          foregroundColor: WidgetStateProperty.all(
            Colors.white,
          ),
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: const Color(0xFF420B56),
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
