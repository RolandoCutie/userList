import 'package:flutter/material.dart';
import 'package:user_list/core/theme/app_colors.dart';

ThemeData buildThemeData() {
  const fontFamily100 = 'MuseoSans-100';
  const fontFamily500 = 'MuseoSans-500';
  const fontFamily700 = 'MuseoSans-700';
  const fontFamily900 = 'MuseoSans-900';
  const fontFamily300 = 'MuseoSans-300';

  return ThemeData(
    useMaterial3: false,
    fontFamily: fontFamily500,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary(),
      secondary: AppColors.secondary(),
      tertiary: AppColors.tertiary(),
      surface: AppColors.white(),
      error: AppColors.error(),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 26,
        fontFamily: fontFamily900,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily500,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontFamily: fontFamily300,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: fontFamily100,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontFamily: fontFamily700,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
