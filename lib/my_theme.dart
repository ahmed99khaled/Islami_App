import 'package:flutter/material.dart';

class Mytheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color yellow = Color(0xFFFACC1D);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    accentColor: lightPrimary,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(fontSize: 22, color: Colors.black),
      headline3: TextStyle(
          fontSize: 31, fontWeight: FontWeight.bold, color: Colors.black),
      headline4: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
      headline5: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(color: Colors.black, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 36, color: Colors.black),
        unselectedIconTheme: IconThemeData(size: 24, color: Colors.white),
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    accentColor: yellow,
    cardColor: darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: darkPrimary),
      headline6: TextStyle(fontSize: 22, color: Colors.white),
      headline3: TextStyle(
          fontSize: 31, fontWeight: FontWeight.bold, color: Colors.white),
      headline4: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
      headline5: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(color: Colors.white, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 36, color: yellow),
        unselectedIconTheme: IconThemeData(size: 24, color: Colors.white),
        selectedLabelStyle: TextStyle(color: yellow),
        selectedItemColor: yellow),
  );
}
