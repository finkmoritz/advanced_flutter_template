import 'dart:ui';

import 'package:advanced_flutter_template/providers/localization/localization_provider_impl.dart';

class LocalizationProviderMock
    extends LocalizationProviderImpl {
  @override
  Future<void> loadPreferences() async {
    locale = const Locale('en');
  }

  @override
  Future<void> savePreferences() async {}
}
