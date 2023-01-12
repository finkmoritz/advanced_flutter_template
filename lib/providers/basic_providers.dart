import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localization/localization_provider.dart';
import 'localization/localization_provider_impl.dart';
import 'theme/theme_provider.dart';
import 'theme/theme_provider_impl.dart';

class BasicProviders extends StatelessWidget {
  final Widget child;

  const BasicProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalizationProvider>(
          create: (_) => LocalizationProviderImpl(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProviderImpl(),
        ),
      ],
      child: child,
    );
  }
}
