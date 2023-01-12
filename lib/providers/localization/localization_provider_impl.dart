import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization_provider.dart';

class LocalizationProviderImpl
    with ChangeNotifier
    implements LocalizationProvider {
  Locale? _locale;

  @override
  Locale? get locale => _locale;

  @override
  set locale(Locale? value) {
    _locale = value;
    savePreferences();
    notifyListeners();
  }

  LocalizationProviderImpl() {
    loadPreferences();
  }

  @protected
  Future<void> loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var languageCode = prefs.getString('locale.languageCode');
    locale = languageCode == null || languageCode.isEmpty
        ? null
        : Locale(languageCode);
  }

  @protected
  Future<void> savePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'locale.languageCode',
      _locale?.languageCode ?? '',
    );
  }
}
