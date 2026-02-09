import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorSheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    
    primary: AppColors.primaryColor,
    onPrimary: AppColors.whiteColor,

    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.primaryColor,

    error: AppColors.errorColor,
    onError: AppColors.whiteColor,

    surface: AppColors.secondaryDarkColor,
    onSurface: AppColors.whiteColor,

    primaryContainer: AppColors.greyDark
  );

  static const dark = ColorScheme(
    brightness: Brightness.light,
    
    primary: AppColors.primaryColor,
    onPrimary: AppColors.whiteColor,

    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.primaryColor,

    error: AppColors.errorColor,
    onError: AppColors.whiteColor,

    surface: AppColors.secondaryColor,
    onSurface: AppColors.whiteColor,
  );
}
