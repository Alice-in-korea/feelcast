import 'package:feelcast/support/style/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Pretendard',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPointColor,
      secondary: AppColors.lightSubPointColor,
      surface: AppColors.lightBgColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightSubPointColor,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Pretendard',
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPointColor,
      secondary: AppColors.darkSubPointColor,
      surface: AppColors.darkBgColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkSubPointColor,
      ),
    ),
  );
}
