// theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Primary color palette
  static const Color primaryColor = Color(0xFFFF5722);
  static const Color secondaryColor = Color(0xFFFFA000);
  static const Color accentColor = Color(0xFF4CAF50);

  // Dark theme colors
  static const Color backgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color lightTextColor = Color(0xFFB3B3B3);

  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: cardColor,
      background: backgroundColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
      displayMedium: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.1,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        color: lightTextColor,
        fontSize: 14,
        height: 1.3,
      ),
      labelLarge: TextStyle(
        color: accentColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: lightTextColor,
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
