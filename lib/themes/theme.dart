import 'package:bloc_state_management/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'colors.dart'; // Adjust the import based on your structure

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: 'Abel',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,  // Define a swatch for consistent Material components.
      backgroundColor: AppColors.backgroundLight,
    ).copyWith(
      primary: AppColors.primaryLight, // Custom primary color
      secondary: AppColors.accent,     // Custom secondary color
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.textPrimaryLight),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimaryLight),
      labelLarge: AppTextStyles.buttonText.copyWith(color: AppColors.textPrimaryLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent, // Use accent color for visibility
        textStyle: AppTextStyles.buttonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'Abel',
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: AppColors.backgroundDark,
    ).copyWith(
      primary: AppColors.primaryDark,  // Custom primary color for dark mode
      secondary: AppColors.accent,     // Custom secondary color for dark mode
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.textPrimaryDark),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimaryDark),
      labelLarge: AppTextStyles.buttonText.copyWith(color: AppColors.textPrimaryDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent, // Use accent color for visibility
        textStyle: AppTextStyles.buttonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
