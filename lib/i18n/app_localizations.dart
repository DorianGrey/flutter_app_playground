import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_app_playground/i18n/generated/messages_all.dart';

/// Localization helper based on the "official" example:
/// https://github.com/flutter/website/blob/master/src/_includes/code/internationalization/intl/main.dart
class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appHeader {
    return Intl.message('Flutter Example App',
        name: 'appHeader', desc: 'General application headline');
  }

  /// For the drawer and corresponding page headers.
  
  String get counterLink {
    return Intl.message('Counter Tester', name: 'counterLink', desc: 'Counter page: Drawer link and headline');
  }

  String get settingsLink {
    return Intl.message('Personal information', name: 'settingsLink', desc: 'Settings page: Drawer link and headline');
  }

  String get barChartLink {
    return Intl.message('Bar chart', name: 'barChartLink', desc: 'Bar chart page: Drawer link and headline');
  }

  /// Stuff for the counter page:

  String get counterLabel {
    return Intl.message('You have pushed the button this many times:',
        name: 'counterLabel',
        desc: 'Label for counter indicator / Counter page');
  }

  String get counterButtonTooltip {
    return Intl.message('Increment',
        name: 'counterButtonTooltip',
        desc: 'Tooltip for the counter incrementer / Counter page');
  }

  /// Stuff for the settings form page:

  String get emailHint {
    return Intl.message('Email address',
        name: 'emailHint', desc: 'Email input field hint / label');
  }

  String get emailError {
    return Intl.message('The input must be a valid email address!',
        name: 'emailError', desc: 'Error text for invalid email fields');
  }

  String get firstNameHint {
    return Intl.message('First name',
        name: 'firstNameHint', desc: 'First name input field hint / label');
  }

  String get firstNameError {
    return Intl.message('The first name must not be empty!',
        name: 'firstNameError', desc: 'Error text for first name fields');
  }

  String get lastNameHint {
    return Intl.message('Last name',
        name: 'lastNameHint', desc: 'Last name input field hint / label');
  }

  String get lastNameError {
    return Intl.message('The last name must not be empty!',
        name: 'lastNameError', desc: 'Error text for last name fields');
  }

  String get dateOfBirth {
    return Intl.message('Date of birth',
        name: 'dateOfBirth', desc: 'Date of birth picker label');
  }

  String get invalidForm {
    return Intl.message('Please fill the form correctly!',
        name: 'invalidForm', desc: 'Invalid form error message');
  }

  /// More general stuff.

  String get processing {
    return Intl.message('Processing...',
        name: 'processing', desc: 'General processing indication label');
  }

  String get submit {
    return Intl.message('Submit', name: 'submit', desc: 'General submit label');
  }

  String get done {
    return Intl.message('Done', name: 'done', desc: 'General "done" label');
  }

  /// For the chart page
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  /// Important: Always check for locale.languageCode, NOT locale.countryCode.
  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false; // TODO: Hm...
}
