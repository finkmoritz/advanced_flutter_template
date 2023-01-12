import 'dart:ui';

import 'package:flutter/foundation.dart';

abstract class LocalizationProvider implements ChangeNotifier {
  Locale? get locale;

  set locale(Locale? value);
}
