import 'package:flutter/material.dart';

/// Utility class for responsive design in YatraMitra.
/// Follows the mandatory rule of using MediaQuery for screen sizing.
class Responsive {
  final BuildContext context;

  Responsive(this.context);

  /// Get the screen width
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Get the screen height
  double get screenHeight => MediaQuery.of(context).size.height;

  /// Returns true if the screen width is greater than 600px (Tablet/Large screen)
  bool get isTablet => screenWidth > 600;

  /// Returns true if the screen width is less than or equal to 600px (Mobile)
  bool get isMobile => screenWidth <= 600;

  /// Percentage-based width
  double widthPct(double percent) => screenWidth * (percent / 100);

  /// Percentage-based height
  double heightPct(double percent) => screenHeight * (percent / 100);
  
  /// Helper to get padding based on device type
  EdgeInsets get screenPadding => isTablet 
      ? const EdgeInsets.symmetric(horizontal: 48, vertical: 24)
      : const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
}
