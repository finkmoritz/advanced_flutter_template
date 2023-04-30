import 'package:advanced_flutter_template/components/my_app_bar.dart';
import 'package:advanced_flutter_template/l10n/auto_import_workaround.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: ElevatedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.play),
          label: Text(AppLocalizations.of(context)!.quickStart),
          onPressed: () {},
        ),
      ),
    );
  }
}
