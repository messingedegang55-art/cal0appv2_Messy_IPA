import 'package:flutter/material.dart';

class C0Theme {
  // --- Muted Palette (Non-Neon) ---
  static const Color sageGreen = Color(0xFF789682);
  static const Color deepSage = Color(0xFF4F6355);
  static const Color mintyFresh = Color(0xFFB2D8C1);
  static const Color warmerGrey = Color(0xFFECEDE8);
  static const Color oatmealWhite = Color(0xFFF5F5F0);
  static const Color charcoal = Color(0xFF1A1C1E);
  static const Color slateGrey = Color(0xFF708090);
  static const Color lightSlateGrey = Color(0xFFB0C4DE);
  static const Color successGreen = Color(0xFF8BB381);
  static const Color warningRed = Color(0xFFD67A7A);

  static C0Colors of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return C0Colors(isDark: isDark);
  }

  // --- Light Mode ---
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: deepSage,
    scaffoldBackgroundColor: slateGrey,
    colorScheme: const ColorScheme.light(
      primary: deepSage,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: charcoal,
      error: warningRed,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: slateGrey,
      foregroundColor: charcoal,
      elevation: 0,
    ),
  );

  // --- Dark Mode ---
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: sageGreen,
    scaffoldBackgroundColor: charcoal,
    colorScheme: const ColorScheme.dark(
      primary: sageGreen,
      onPrimary: charcoal,
      surface: Color(0xFF252729),
      onSurface: Colors.white,
      error: warningRed,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: charcoal, elevation: 0),
  );
}

// 👇 all mode-aware colors live here
class C0Colors {
  final bool isDark;
  const C0Colors({required this.isDark});

  // Primary — deepSage in light, sageGreen in dark
  Color get primary => isDark ? C0Theme.sageGreen : C0Theme.deepSage;

  // Background — charcoal in dark, oatmealWhite in light
  Color get background => isDark ? C0Theme.charcoal : C0Theme.oatmealWhite;

  // Card surface — slightly lighter charcoal in dark, white in light
  Color get card => isDark ? const Color(0xFF252729) : Colors.white;

  // Text colors
  Color get textPrimary => isDark ? Colors.white : C0Theme.charcoal;
  Color get textSecondary => isDark ? Colors.white70 : C0Theme.slateGrey;

  // Header/AppBar background
  Color get header => isDark ? const Color(0xFF252729) : C0Theme.deepSage;

  // Icon color
  Color get icon => isDark ? C0Theme.sageGreen : C0Theme.deepSage;

  // Progress bar track (behind the fill)
  Color get track =>
      isDark ? Colors.white12 : C0Theme.sageGreen.withOpacity(0.2);

  // Fixed colors — same in both modes
  Color get success => C0Theme.successGreen;
  Color get warning => C0Theme.warningRed;
  Color get slate => C0Theme.slateGrey;
}
