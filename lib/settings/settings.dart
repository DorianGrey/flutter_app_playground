import 'package:flutter/material.dart';
import 'package:flutter_app_playground/drawer/navigation_drawer.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_app_playground/settings/settings_form.dart';

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
        drawer: NavigationDrawer(),
        body: SettingsForm());
  }
}
