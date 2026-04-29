import 'package:flutter/material.dart';

class WeatherUtils {
  /// Maps OpenWeatherMap condition strings to Flutter Icons.
  static IconData getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'thunderstorm':
        return Icons.thunderstorm_rounded;
      case 'drizzle':
        return Icons.water_drop_rounded;
      case 'rain':
        return Icons.umbrella_rounded;
      case 'snow':
        return Icons.ac_unit_rounded;
      case 'clear':
        return Icons.wb_sunny_rounded;
      case 'clouds':
        return Icons.cloud_rounded;
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
      case 'sand':
      case 'ash':
      case 'squall':
      case 'tornado':
        return Icons.foggy;
      default:
        return Icons.cloud_queue_rounded;
    }
  }

  /// Maps risk levels to appropriate icons.
  static IconData getRiskIcon(String riskLevel) {
    switch (riskLevel.toLowerCase()) {
      case 'high':
        return Icons.report_problem_rounded;
      case 'medium':
        return Icons.warning_amber_rounded;
      case 'low':
      default:
        return Icons.check_circle_outline_rounded;
    }
  }

  /// Maps risk levels to theme colors.
  static Color getRiskColor(String riskLevel) {
    switch (riskLevel.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
      default:
        return Colors.green;
    }
  }
}
