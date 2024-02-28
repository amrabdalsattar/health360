import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/utils/app_color.dart';

abstract class AppTheme {

  static ThemeData lightMode = ThemeData(
    canvasColor: AppColor.white,
    primaryColor: AppColor.primary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.black,
      unselectedItemColor: AppColor.grey,
    ),

      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,),



    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColor.black,
        fontSize: 26.sp,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
          color: AppColor.grey,
          fontSize: 16.sp,
        fontWeight: FontWeight.bold
      ),
      bodyLarge: const TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.normal
      ),
      bodyMedium: const TextStyle(color: AppColor.black)
    ),


    scaffoldBackgroundColor: AppColor.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
      dialogTheme: const DialogTheme(
          backgroundColor: AppColor.white
      )
  );

  static ThemeData darkMode = ThemeData(
    canvasColor: AppColor.darkSecondary,
    primaryColor: AppColor.darkPrimary,
    scaffoldBackgroundColor: AppColor.darkSecondary,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.white,
      unselectedItemColor: AppColor.darkGrey,
      backgroundColor: AppColor.darkPrimary
    ),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: AppColor.white,
            fontSize: 26.sp,
            fontWeight: FontWeight.bold
        ),
        headlineMedium: TextStyle(
            color: AppColor.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold
        ),
        bodyLarge: const TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.normal
        ),
        bodyMedium: const TextStyle(color: AppColor.white)
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.darkAccent,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColor.darkPrimary,
    ),
  );

}