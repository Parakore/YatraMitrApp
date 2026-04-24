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

  // Private constructor to prevent instantiation
  AppColors._();
}
