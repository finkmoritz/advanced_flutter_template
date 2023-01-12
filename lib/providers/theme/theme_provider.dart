import 'package:flutter/material.dart';

abstract class ThemeProvider implements ChangeNotifier {
  ThemeMode get themeMode;

  set themeMode(ThemeMode value);

  toggleThemeMode();

  ThemeData get lightTheme;
  ThemeData get darkTheme;
}
