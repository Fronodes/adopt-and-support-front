import 'package:flutter/material.dart';

import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static AppLocalizations? instance;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var localizations = AppLocalizations(locale);
    await localizations.load();

    instance = localizations;

    return localizations;
  }

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
