import 'package:flutter/material.dart';
import 'package:todo_app/services/color_service.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class Themes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      brightness: Brightness.dark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorService.lightMain2,
        foregroundColor: ColorService.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorService.lightMain2,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ),

    AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: ColorService.grey,
      primaryColor: ColorService.white,
      backgroundColor: ColorService.backgroundLightTheme,
      dividerColor: ColorService.main,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorService.main,
        foregroundColor: ColorService.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorService.main,
        foregroundColor: ColorService.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ColorService.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: ColorService.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorService.main,
        selectedItemColor: ColorService.white,
        unselectedItemColor: ColorService.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ),
  };
}
