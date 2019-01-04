import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_app_playground/settings/settings.dart';
import 'package:flutter_app_playground/counterPage.dart';
import 'package:flutter_app_playground/store/state.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key, @required this.store}): super(key: key);

  final Store<AppState> store;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          CounterPage.ROUTE_NAME: (context) => CounterPage(),
          SettingsPage.ROUTE_NAME: (context) => SettingsPage(),
        }
      ),
    );
  }
}
