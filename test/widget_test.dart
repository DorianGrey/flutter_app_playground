// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_playground/my_app.dart';
import 'package:flutter_app_playground/store/state.dart';
import 'package:flutter_app_playground/store/reducers.dart';

// Test is still failing. Seems to have something to do with
// the internationlization stuff.
// See issue on GitHub: https://github.com/flutter/flutter/issues/22193

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    tester.runAsync(() async {
      final store =
        Store<AppState>(rootReducer, initialState: AppState.initial());
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp(store: store));
      await tester.pumpAndSettle();

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
