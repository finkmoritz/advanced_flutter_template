import 'package:flutter/material.dart';

abstract class ThemeProvider implements ChangeNotifier {
  ThemeMode get themeMode;

  set themeMode(ThemeMode value);

  void toggleThemeMode();

  ThemeData get lightTheme;
  ThemeData get darkTheme;
  ThemeData get highContrastLightTheme;
  ThemeData get highContrastDarkTheme;
}
