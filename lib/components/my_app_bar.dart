import 'package:advanced_flutter_template/l10n/auto_import_workaround.dart';
import 'package:advanced_flutter_template/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(AppLocalizations.of(context)!.appTitle),
      actions: [
        IconButton(
          icon: themeProvider.themeMode == ThemeMode.dark
              ? const FaIcon(FontAwesomeIcons.sun)
              : const FaIcon(FontAwesomeIcons.moon),
          onPressed: () => themeProvider.themeMode =
              themeProvider.themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
        ),
      ],
    );
  }
}
