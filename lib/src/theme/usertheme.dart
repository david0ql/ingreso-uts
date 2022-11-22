import 'package:flutter/material.dart';

class UserTheme {
  static const primaryColor = Color.fromARGB(255, 2, 68, 46);
  static final mainTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      //Scaffold background
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: primaryColor)));
}
