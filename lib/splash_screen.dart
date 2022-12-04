import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Image.asset(
      settingsProvider.isDark()
          ? 'assets/images/main_background_night.png'
          : 'assets/images/splash_screen.png',
      fit: BoxFit.fill,
    );
  }
}
