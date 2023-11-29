import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';

abstract class AppTheme{
  static ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColor.black,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
          color: AppColor.black,
          fontSize: 18,
      ),
    )
  );
  static ThemeData darkMode = ThemeData(

  );
}