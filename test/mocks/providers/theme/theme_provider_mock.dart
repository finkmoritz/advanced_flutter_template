import 'package:advanced_flutter_template/providers/theme/theme_provider_impl.dart';
import 'package:flutter/material.dart';

class ThemeProviderMock extends ThemeProviderImpl {
  ThemeProviderMock() : super();

  @override
  Future<void> loadPreferences() async {
    themeMode = ThemeMode.light;
  }

  @override
  Future<void> savePreferences() async {}
}
