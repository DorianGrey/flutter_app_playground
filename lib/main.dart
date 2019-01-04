import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_playground/my_app.dart';
import 'package:flutter_app_playground/store/state.dart';
import 'package:flutter_app_playground/store/reducers.dart';

void main() {
  final store = Store<AppState>(rootReducer, initialState: AppState.initial());
  runApp(MyApp(store: store));
}


