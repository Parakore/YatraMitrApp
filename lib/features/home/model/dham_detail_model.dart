import 'package:flutter/material.dart';

enum DhamStatus { open, caution, closed }

class WeatherSnapshot {
  final String temperature;
  final String condition;
  final int rainChance;
  final IconData icon;

  const WeatherSnapshot({
    required this.temperature,
    required this.condition,
    required this.rainChance,
    required this.icon,
  });
}

class CrowdStatus {
  final String level; // Low, Moderate, High
  final String suggestedTime;
  final Color color;

  const CrowdStatus({
    required this.level,
    required this.suggestedTime,
    required this.color,
  });
}

class HelicopterDetails {
  final String priceRange;
  final String duration;
  final String bookingWarning;
  final String officialUrl;

  const HelicopterDetails({
    required this.priceRange,
    required this.duration,
    required this.bookingWarning,
    required this.officialUrl,
  });
}

class Facility {
  final String name;
  final String iconPath;
  final IconData fallbackIcon;
  final String description;

  const Facility({
    required this.name,
    required this.iconPath,
    required this.fallbackIcon,
    required this.description,
  });
}

/// Model for detailed transport information.
class TransportInfo {
  final String title;
  final String description;
  final String iconPath;
  final IconData? fallbackIcon;

  const TransportInfo({
    required this.title,
    required this.description,
    required this.iconPath,
    this.fallbackIcon,
  });
}

/// Model for route visualization steps.
class RouteStep {
  final String name;
  final String? distanceToNext;
  final IconData icon;

  const RouteStep({
    required this.name,
    this.distanceToNext,
    required this.icon,
  });
}

/// Model for safety advisories.
class SafetyAdvisory {
  final String title;
  final String message;

  const SafetyAdvisory({
    required this.title,
    required this.message,
  });
}

/// Main model for Dham details.
class DhamDetailModel {
  final String id;
  final String name;
  final String openingDate;
  final String bestTime;
  final String altitude;
  final String difficulty;
  final String duration;
  final String trekDistance;
  final String imageUrl;
  final DhamStatus status;
  final WeatherSnapshot weather;
  final CrowdStatus crowd;
  final HelicopterDetails heli;
  final List<TransportInfo> transports;
  final List<RouteStep> routeSteps;
  final List<Facility> facilities;
  final List<SafetyAdvisory> advisories;

  const DhamDetailModel({
    required this.id,
    required this.name,
    required this.openingDate,
    required this.bestTime,
    required this.altitude,
    required this.difficulty,
    required this.duration,
    required this.trekDistance,
    required this.imageUrl,
    required this.status,
    required this.weather,
    required this.crowd,
    required this.heli,
    required this.transports,
    required this.routeSteps,
    required this.facilities,
    required this.advisories,
  });
}
