import 'package:advanced_flutter_template/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/localization/localization_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var localizationProvider = context.watch<LocalizationProvider>();
    var themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () => context.go('/'),
        ),
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.darkTheme),
            trailing: Switch(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (_) => themeProvider.toggleThemeMode(),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            trailing: DropdownButton<Locale>(
              value: localizationProvider.locale,
              onChanged: (Locale? value) {
                localizationProvider.locale = value;
              },
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text(AppLocalizations.of(context)!.system),
                ),
                ...AppLocalizations.supportedLocales
                    .map((supportedLocale) => DropdownMenuItem(
                          value: supportedLocale,
                          child: Text(
                            supportedLocale.languageCode.toUpperCase(),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
