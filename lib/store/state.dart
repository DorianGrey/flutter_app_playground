import 'package:meta/meta.dart';

@immutable
class AppState {
  final int counter;

  const AppState({
    this.counter
  });

  factory AppState.initial() => AppState(counter: 0);
}
