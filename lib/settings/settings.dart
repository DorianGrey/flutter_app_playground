import 'package:flutter/material.dart';
import 'package:flutter_app_playground/helpers/drawer.dart';
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
        title: Text("Settings testing page"),
      ),
      drawer: createDefaultAppDrawer(context, SettingsPage.ROUTE_NAME),
      body: SettingsForm()
    );
  }
}