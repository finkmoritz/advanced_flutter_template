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
      scheme: _scheme(),
    );
    return baseTheme.copyWith(
      textTheme: _textTheme(baseTheme.textTheme),
    );
  }

  @override
  ThemeData get darkTheme {
    var baseTheme = FlexThemeData.dark(
      scheme: _scheme(),
    );
    return baseTheme.copyWith(
      textTheme: _textTheme(baseTheme.textTheme),
    );
  }

  @override
  ThemeData get highContrastLightTheme {
    var baseTheme = FlexThemeData.light(
      scheme: _highContrastScheme(),
    );
    return baseTheme.copyWith(
      textTheme: _textTheme(baseTheme.textTheme),
    );
  }

  @override
  ThemeData get highContrastDarkTheme {
    var baseTheme = FlexThemeData.dark(
      scheme: _highContrastScheme(),
    );
    return baseTheme.copyWith(
      textTheme: _textTheme(baseTheme.textTheme),
    );
  }

  FlexScheme _scheme() => FlexScheme.material;
  FlexScheme _highContrastScheme() => FlexScheme.materialHc;

  TextTheme _textTheme(TextTheme textTheme) => GoogleFonts.robotoTextTheme(textTheme);
}
