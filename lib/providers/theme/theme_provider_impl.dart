import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_provider.dart';

class ThemeProviderImpl
    with ChangeNotifier
    implements ThemeProvider {
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      savePreferences();
      notifyListeners();
    }
  }

  ThemeProviderImpl() {
    loadPreferences();
  }

  @override
  toggleThemeMode() {
    themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @protected
  Future<void> loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var isLightMode = prefs.getBool('theme_mode') ?? false;
    themeMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
  }

  @protected
  Future<void> savePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'theme_mode',
      _themeMode == ThemeMode.light,
    );
  }

  @override
  ThemeData get lightTheme {
    var baseTheme = FlexThemeData.light(
      scheme: FlexScheme.indigo,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
    );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }

  @override
  ThemeData get darkTheme {
    var baseTheme = FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
    );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }
}
