import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        colorSchemeSeed: AppColor.backgroundColor,
        fontFamily: 'Nunito',
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.black),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF0A2A5E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        colorSchemeSeed: AppColor.backgroundColor,
        fontFamily: 'Nunito',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.white),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF0A2A5E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
