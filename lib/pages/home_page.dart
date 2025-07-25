import 'package:advanced_flutter_template/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.faceSmileWink),
          label: Text(AppLocalizations.of(context)!.clickMe),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)!.helloWorld),
          )),
        ),
      ),
    );
  }
}
