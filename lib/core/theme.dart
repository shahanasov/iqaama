import 'package:flutter/material.dart';

class AppColors {
  // Primary Color Scheme
  static const Color primary = Color(0xFF002E6E); // Dark Blue
  static const Color secondary = Color(0xFF264056); // Soft Blue

  // Accent Colors
  static const Color accent = Color(0xFFD1B05D); // Gold
  static const Color cyanLight = Color(0xFFF9FFFF); // Almost white with blue tint

  // Text Colors
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF888888);

  // Backgrounds
  static const Color background = Color(0xFFF5F6FA); // Light grayish
  static const Color cardBackground = Color(0xFFEDEDED); // Optional card color
  static const Color white = Colors.white;
}


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
      labelLarge: TextStyle(color: AppColors.textDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,// 
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColors.textLight),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}
