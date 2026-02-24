import 'package:ecommerce_apple_tech_app/core/theme/app_color_sheme.dart';
import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      useMaterial3: true,
      colorScheme: AppColorSheme.light,

      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
      ),

      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.mainTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: AppColors.mainTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.mainTextColor,
        ),
        displaySmall: TextStyle(fontSize: 20, color: AppColors.mainTextColor),
        bodyLarge: TextStyle(
          color: AppColors.mainTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 16,
        ),
        bodySmall: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
        labelSmall: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 14,
        ),
        labelLarge: TextStyle(color: AppColors.whiteColor, fontSize: 16),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        prefixIconColor: AppColors.secondaryTextColor,
        suffixIconColor: AppColors.secondaryTextColor,
        hintStyle: const TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.secondaryDarkColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.secondaryDarkColor),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.whiteColor,
        strokeCap: StrokeCap.round,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      useMaterial3: true,
      colorScheme: AppColorSheme.dark,

      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
      ),
    );
  }
}
