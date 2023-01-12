import 'package:advanced_flutter_template/providers/localization/localization_provider.dart';
import 'package:advanced_flutter_template/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localization/localization_provider_mock.dart';
import 'theme/theme_provider_mock.dart';

class BasicProvidersMock extends StatelessWidget {
  final Widget child;

  const BasicProvidersMock({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalizationProvider>(
          create: (_) => LocalizationProviderMock(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProviderMock(),
        ),
      ],
      child: child,
    );
  }
}
