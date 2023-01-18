import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/home/hadeth_details/hadeth_details_screen.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/sura_details/sura_details_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  late SettingsProvider settingsProvider;

  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    getValueFromSharedPreference();

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(settingsProvider.language),
      // language still Arabic

      debugShowCheckedModeBanner: false,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      themeMode: settingsProvider.currentTheme,

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }

  void getValueFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();

    settingsProvider.changeLanguage(prefs.getString('lang') ?? 'en');
    if (prefs.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
