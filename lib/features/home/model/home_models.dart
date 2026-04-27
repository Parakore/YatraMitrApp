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

/// Categories for Travel Essentials to drive specific UI layouts.
enum EssentialCategory {
  health,
  guidelines,
  rules,
  packing,
}

/// Model representing a Travel Essential item on the listing page.
class TravelEssential {
  final String title;
  final String iconPath;
  final String route;
  final EssentialCategory category;

  const TravelEssential({
    required this.title,
    required this.iconPath,
    required this.route,
    required this.category,
  });
}

/// Model representing the rich detail content for a Travel Essential.
class TravelEssentialDetail {
  final String title;
  final String description;
  final List<EssentialSection> sections;
  final List<ChecklistItem>? checklist;

  const TravelEssentialDetail({
    required this.title,
    required this.description,
    required this.sections,
    this.checklist,
  });
}

/// A section within an essential detail page (e.g., "Food Safety").
class EssentialSection {
  final String title;
  final String content;
  final IconData icon;
  final Color? accentColor;

  const EssentialSection({
    required this.title,
    required this.content,
    required this.icon,
    this.accentColor,
  });
}

/// A checklist item (primarily for packing).
class ChecklistItem {
  final String item;
  final String category;
  final bool isRequired;
  final bool isChecked;

  const ChecklistItem({
    required this.item,
    required this.category,
    this.isRequired = true,
    this.isChecked = false,
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
