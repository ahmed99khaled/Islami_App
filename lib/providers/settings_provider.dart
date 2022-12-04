import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String language = 'en';

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
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

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
