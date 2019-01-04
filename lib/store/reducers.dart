import 'package:redux/redux.dart';

import 'package:flutter_app_playground/store/actions.dart';
import 'package:flutter_app_playground/store/state.dart';

/*
  For the breakdown / split pattern, see:
  https://github.com/johnpryan/redux.dart/blob/master/doc/combine_reducers.md
 */

int _counterReducer(int state, dynamic _) {
  return state + 1;
}

final counterReducer = combineReducers<int>([
  TypedReducer<int, IncrementCounter>(_counterReducer)
]);

AppState rootReducer(AppState state, dynamic action) {
  return AppState(counter: counterReducer(state.counter, action));
}