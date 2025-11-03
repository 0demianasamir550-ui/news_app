import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  AppLanguageProvider() {
    loadLanguage();
  }

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode == _appLocale.languageCode) return;

    _appLocale = Locale(languageCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? code = prefs.getString('languageCode');
    if (code != null) {
      _appLocale = Locale(code);
      notifyListeners();
    }
  }
}