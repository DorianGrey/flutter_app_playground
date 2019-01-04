# flutter_app_playground

A flutter playground application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# Tasks for updating the intl stuff:
- Extract messages to arb: `flutter packages pub run intl_translation:extract_to_arb --output-dir=lib/i18n/generated lib/i18n/app_localizations.dart` (each target file has to be added separately, if required)
- Generated `dart` message files from arb: `flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/i18n/generated --no-use-deferred-loading lib/i18n/app_localizations.dart lib/i18n/intl_de.arb lib/i18n/intl_en.arb` (once again: wildcard does not seem to work, at least not on windows)