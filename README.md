[![CircleCI](https://circleci.com/gh/DorianGrey/flutter_app_playground.svg?style=svg)](https://circleci.com/gh/DorianGrey/flutter_app_playground)

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

# Updating the intl stuff:
Currently, all texts used within the app are listed in `lib/i18n/app_localizations.dart`. When adding any messages here, they have to be extracted and translated to be practically usable.

1. Stop the current dev mode, if active. (Recommended, but might not be required) 
2. Extract messages to arb: `flutter packages pub run intl_translation:extract_to_arb --output-dir=lib/i18n/generated lib/i18n/app_localizations.dart` (each target file has to be added separately, if required) - for VSCode, there is a task named `[i18n] Extract messages` to simplify this.
3. Generated `dart` message files from arb: `flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/i18n/generated --no-use-deferred-loading lib/i18n/app_localizations.dart lib/i18n/intl_de.arb lib/i18n/intl_en.arb` (once again: wildcard does not seem to work, at least not on windows) - for VSCode, there is a task named `[i18n] Generate dart from arb` to simplify this.
4. Start again.