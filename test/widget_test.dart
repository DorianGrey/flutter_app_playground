// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app_playground/counter_page.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_playground/store/state.dart';
import 'package:flutter_app_playground/store/reducers.dart';

// Test is still failing. Seems to have something to do with
// the internationlization stuff.
// See issue on GitHub: https://github.com/flutter/flutter/issues/22193

void main() {
  Widget createTestWidget({Widget child, Store<AppState> store}) {
    final matApp = MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale("en", "GB")
        ],
        onGenerateTitle: (context) => AppLocalizations.of(context).appHeader,
        theme: ThemeData.light(),
        home: child);
    return StoreProvider(child: matApp, store: store);
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final store =
        Store<AppState>(rootReducer, initialState: AppState.initial());
    final widget = createTestWidget(child: CounterPage(), store: store);

    // Build our app and trigger a frame.
    await tester.pumpWidget(widget);
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
}
