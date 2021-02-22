import 'package:flutter/material.dart';
import 'package:flutter_app_playground/bar_chart_page.dart';
import 'package:flutter_app_playground/counter_page.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_app_playground/maps/map_view_page.dart';
import 'package:flutter_app_playground/pie_chart_page.dart';
import 'package:flutter_app_playground/settings/settings.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRouteName = ModalRoute.of(context).settings.name;
    final drawerContent = <Widget>[
      DrawerHeader(
        child: Center(
          child: Icon(
            Icons.assignment_ind,
            size: IconTheme.of(context).size * 4,
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      ListTile(
          leading: Icon(Icons.timer),
          title: Text(AppLocalizations.of(context).counterLink),
          selected: currentRouteName == CounterPage.ROUTE_NAME,
          onTap: () {
            if (currentRouteName != CounterPage.ROUTE_NAME) {
              Navigator.pushNamed(context, CounterPage.ROUTE_NAME);
            }
          }),
      ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(AppLocalizations.of(context).settingsLink),
          selected: currentRouteName == SettingsPage.ROUTE_NAME,
          onTap: () {
            if (currentRouteName != SettingsPage.ROUTE_NAME) {
              Navigator.pushNamed(context, SettingsPage.ROUTE_NAME);
            }
          }),
      ListTile(
        leading: Icon(Icons.table_chart),
        title: Text(AppLocalizations.of(context).barChartLink),
        selected: currentRouteName == BarChartPage.ROUTE_NAME,
        onTap: () {
          if (currentRouteName != BarChartPage.ROUTE_NAME) {
            Navigator.pushNamed(context, BarChartPage.ROUTE_NAME);
          }
        },
      ),
      ListTile(
        leading: Icon(Icons.pie_chart_outlined),
        title: Text(AppLocalizations.of(context).pieChartLink),
        selected: currentRouteName == PieChartPage.ROUTE_NAME,
        onTap: () {
          if (currentRouteName != PieChartPage.ROUTE_NAME) {
            Navigator.pushNamed(context, PieChartPage.ROUTE_NAME);
          }
        },
      ),
      ListTile(
        leading: Icon(Icons.map),
        title: Text(AppLocalizations.of(context).mapViewLink),
        selected: currentRouteName == MapViewPage.ROUTE_NAME,
        onTap: () {
          if (currentRouteName != MapViewPage.ROUTE_NAME) {
            Navigator.pushNamed(context, MapViewPage.ROUTE_NAME);
          }
        },
      )
    ];

    return Drawer(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, idx) {
            if (idx < drawerContent.length) {
              return drawerContent[idx];
            }
            return null;
          },
          itemCount: drawerContent.length),
    );
  }
}
