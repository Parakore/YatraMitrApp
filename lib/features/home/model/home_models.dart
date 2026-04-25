import 'package:flutter/material.dart';

/// Model representing a holy Dham for the Yatra.
class DhamInfo {
  final String name;
  final String description;
  final String imageUrl;

  const DhamInfo({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

/// Model representing a Quick Action on the home screen.
class QuickAction {
  final String title;
  final String iconPath;
  final String route;
  final Color color;

  const QuickAction({
    required this.title,
    required this.iconPath,
    required this.route,
    required this.color,
  });
}

/// Model representing a Travel Essential item.
class TravelEssential {
  final String title;
  final String iconPath;
  final String route;

  const TravelEssential({
    required this.title,
    required this.iconPath,
    required this.route,
  });
}

/// Model representing a Weather Alert.
class WeatherAlert {
  final String title;
  final String message;
  final bool isCritical;

  const WeatherAlert({
    required this.title,
    required this.message,
    this.isCritical = false,
  });
}
