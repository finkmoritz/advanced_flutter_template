import 'package:advanced_flutter_template/l10n/auto_import_workaround.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
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
    );
  }
}
