import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData androidLightTheme = ThemeData(
      fontFamily: 'Poppins',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.purple),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        type: BottomNavigationBarType.fixed,
      ));
}
