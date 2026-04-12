// theme/app_colors.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary
  static const deepNavy = Color(0xFF1B3A6B);
  static const brandGold = Color(0xFFF5A623);
  static const midnight = Color(0xFF0F2447);

  // Semantic
  static const success = Color(0xFF22C55E);
  static const error = Color(0xFFEF4444);
  static const warning = Color(0xFFF59E0B);
  static const nfcBlue = Color(0xFF3B82F6);

  // Neutral
  static const surface = Color(0xFFF7F8FA);
  static const border = Color(0xFFE9ECF3);
  static const mutedText = Color(0xFF6B7A99);
  static const darkSurface = Color(0xFF1A1D2E);
  
  static const lightSurface = Color(0xFFFFFFFF);
}

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.deepNavy,
    primary: AppColors.deepNavy,
    secondary: AppColors.brandGold,
    surface: AppColors.surface,
    error: AppColors.error,
  ),
  iconTheme: IconThemeData(color: AppColors.surface),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: AppColors.surface),
  ),
  scaffoldBackgroundColor: AppColors.deepNavy,
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.nfcBlue,
    labelPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(50),
    ),
  ),
  textTheme: GoogleFonts.interTextTheme().copyWith(
    headlineSmall: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: AppColors.deepNavy,
    ),
    bodyMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: AppColors.deepNavy,
    ),
    bodySmall: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: AppColors.deepNavy,
    ),
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: AppColors.deepNavy,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: AppColors.deepNavy,
    ),
    titleLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      color: AppColors.deepNavy,
    ),
    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: AppColors.deepNavy,
    ),
    labelSmall: GoogleFonts.jetBrainsMono(
      letterSpacing: 0.06,
      color: AppColors.deepNavy,
    ),
  ),
  useMaterial3: true,
);
