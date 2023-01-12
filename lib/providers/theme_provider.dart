import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider
    with ChangeNotifier, DiagnosticableTreeMixin
    implements Listenable {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    if (_themeMode != value) {
      _themeMode = value;
      _savePreferences();
      notifyListeners();
    }
  }

  ThemeProvider() {
    _loadPreferences();
  }

  toggleThemeMode() {
    themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var isLightMode = prefs.getBool('theme_mode') ?? false;
    themeMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> _savePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'theme_mode',
      _themeMode == ThemeMode.light,
    );
  }

  static ThemeData get lightTheme {
    var baseTheme = FlexThemeData.light(
      scheme: FlexScheme.indigo,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
    );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }

  static ThemeData get darkTheme {
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
