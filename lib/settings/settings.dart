import 'package:flutter/material.dart';
import 'package:flutter_app_playground/helpers/drawer.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_app_playground/settings/settingsForm.dart';

class SettingsPage extends StatefulWidget {

  SettingsPage({Key key}) : super(key: key);

  static const ROUTE_NAME = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settingsLink),
      ),
      drawer: createDefaultAppDrawer(context, SettingsPage.ROUTE_NAME),
      body: SettingsForm()
    );
  }
}