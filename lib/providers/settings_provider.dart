import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String language = 'en';

  void changeTheme(ThemeMode newMode) async {
    final prefs = await SharedPreferences.getInstance();
    currentTheme = newMode;
    await prefs.setString(
        'theme', currentTheme == ThemeMode.light ? 'light' : 'dark');

    notifyListeners();
  }

  String getMainBackground() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/main_background_dark.png';
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  void changeLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    language = lang;
    await prefs.setString('lang', language);
    notifyListeners();
  }
}
