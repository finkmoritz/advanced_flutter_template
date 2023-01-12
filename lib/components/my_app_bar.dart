import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../l10n/auto_import_workaround.dart';
import '../pages/settings_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(AppLocalizations.of(context)!.appTitle),
      actions: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.gear),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SettingsPage(),
            ),
          ),
        ),
      ],
    );
  }
}
