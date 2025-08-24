import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appLightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.purple),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        type: BottomNavigationBarType.fixed,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ));

  static ThemeData appDarkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.purple),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        type: BottomNavigationBarType.fixed,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      textTheme: const TextTheme());
}
