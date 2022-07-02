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
      primarySwatch: ColorService.grey,
      primaryColor: ColorService.black,
      backgroundColor: ColorService.backgroundDarkTheme,
      dividerColor: ColorService.lightBlack,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorService.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ColorService.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: ColorService.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorService.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: ColorService.white,
      ),
    ),
    AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: ColorService.grey,
      primaryColor: ColorService.white,
      backgroundColor: ColorService.backgroundLightTheme,
      dividerColor: Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorService.black,
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorService.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: ColorService.white,
      ),
    ),
  };
}
