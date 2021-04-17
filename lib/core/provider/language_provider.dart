import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return;
    }
    _appLocale = Locale(prefs.getString('language_code') ?? 'en');
    return;
  }

  Future<void> changeLanguage(type) async {
    if (Locale(type) == _appLocale || (type != 'tr' && type != 'en')) return;
    _appLocale = Locale(type);
    notifyListeners();
  }
}
