import 'package:flutter/material.dart';

class UserTheme {
  static const primaryColor = Color(0XFF1b5e20);
  static final mainTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      //Scaffold background
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: primaryColor)));
}
