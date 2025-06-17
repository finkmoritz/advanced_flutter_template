import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

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
          onPressed: () => context.go('/settings'),
        ),
      ],
    );
  }
}
