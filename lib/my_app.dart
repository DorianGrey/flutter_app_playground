import 'package:flutter/material.dart';
import 'package:flutter_app_playground/barChartPage.dart';
import 'package:flutter_app_playground/pieChartPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_app_playground/settings/settings.dart';
import 'package:flutter_app_playground/counterPage.dart';
import 'package:flutter_app_playground/store/state.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';

import 'maps/mapViewPage.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            const Locale("en", "GB"),
            const Locale("de", "DE")
          ],
          onGenerateTitle: (context) => AppLocalizations.of(context).appHeader,
          theme: ThemeData.light(),
          initialRoute: '/',
          routes: {
            CounterPage.ROUTE_NAME: (context) => CounterPage(),
            SettingsPage.ROUTE_NAME: (context) => SettingsPage(),
            BarChartPage.ROUTE_NAME: (context) => BarChartPage(),
            PieChartPage.ROUTE_NAME: (context) => PieChartPage(),
            MapViewPage.ROUTE_NAME: (context) => MapViewPage(),
          }),
    );
  }
}
