import 'package:flutter/material.dart';

/// Centralized color constants for the YatraMitra application.
/// Follows the strict design system rules for consistency and accessibility.
class AppColors {
  // Primary & Secondary
  static const Color primary = Color(0xFFFF7A00); // Action Orange
  static const Color secondary = Color(0xFF1E3A8A); // Trust Blue

  // Background & Surface
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xDE000000); // #212121 equivalent
  static const Color textSecondary = Color(0x99000000); // #616161 equivalent

  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);

  // Web Proto Colors
  static const Color saffron = Color(0xFFFF6B00);
  static const Color gold = Color(0xFFD4A017);
  static const Color blueDark = Color(0xFF0D1B2A);
  static const Color purple = Color(0xFF6F42C1);
  static const Color teal = Color(0xFF17A2B8);
  
  // UI Elements
  static const Color divider = Color(0xFFE0E0E0);
  static const Color accent = Color(0xFFFF7A00); // Matches primary for consistency

  // Private constructor to prevent instantiation
  AppColors._();
}
