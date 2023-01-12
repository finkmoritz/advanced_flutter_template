import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider
    with ChangeNotifier, DiagnosticableTreeMixin
    implements Listenable {
  Locale? _locale;

  Locale? get locale => _locale;

  set locale(Locale? value) {
    _locale = value;
    _savePreferences();
    notifyListeners();
  }

  LocalizationProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var languageCode = prefs.getString('locale.languageCode');
    locale = languageCode == null || languageCode.isEmpty
        ? null
        : Locale(languageCode);
  }

  Future<void> _savePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'locale.languageCode',
      _locale?.languageCode ?? '',
    );
  }
}
