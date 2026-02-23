import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkPremium() {
    const seed = Color(0xFF7C4DFF);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.dark,
      ).copyWith(
        surface: const Color(0xFF121220),
        surfaceContainerHighest: const Color(0xFF1D1A2E),
      ),
      scaffoldBackgroundColor: const Color(0xFF0B0A14),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1A1830),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
