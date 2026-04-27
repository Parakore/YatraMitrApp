import 'package:flutter/material.dart';

/// Model representing a holy Dham for the Yatra.
class DhamInfo {
  final String name;
  final String description;
  final String location;
  final String imageUrl;
  final double temperature;
  final String crowdStatus;
  final String altitude;
  final String? alertMessage;
  final bool isOpen;

  const DhamInfo({
    required this.name,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.temperature,
    required this.crowdStatus,
    required this.altitude,
    this.alertMessage,
    this.isOpen = true,
  });
}



/// Model representing a Quick Action on the home screen.
class QuickAction {
  final String title;
  final String iconPath;
  final String route;
  final Color color;
  final bool isFuture;

  const QuickAction({
    required this.title,
    required this.iconPath,
    required this.route,
    required this.color,
    this.isFuture = false,
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
