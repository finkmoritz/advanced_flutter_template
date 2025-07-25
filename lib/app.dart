import 'package:advanced_flutter_template/providers/localization/localization_provider.dart';
import 'package:advanced_flutter_template/providers/theme/theme_provider.dart';
import 'package:advanced_flutter_template/router/my_router_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Flutter Template',
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      highContrastTheme: themeProvider.highContrastLightTheme,
      highContrastDarkTheme: themeProvider.highContrastDarkTheme,
      locale: context.watch<LocalizationProvider>().locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: myRouterConfig,
    );
  }
}
