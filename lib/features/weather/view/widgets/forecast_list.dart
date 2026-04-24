import 'package:flutter/material.dart';
import 'package:yatramitra/features/weather/model/weather_models.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class ForecastList extends StatelessWidget {
  final List<ForecastModel> forecasts;
  const ForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: forecasts.length,
        itemBuilder: (context, index) {
          final forecast = forecasts[index];
          return Container(
            width: 90,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.surface, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('E').format(forecast.date),
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 8),
                _getWeatherIcon(forecast.condition),
                const SizedBox(height: 8),
                Text(
                  '${forecast.temperature.toStringAsFixed(0)}°',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getWeatherIcon(String condition) {
    IconData icon;
    Color color;
    switch (condition.toLowerCase()) {
      case 'rain':
        icon = Icons.umbrella;
        color = Colors.blue;
        break;
      case 'clouds':
        icon = Icons.cloud;
        color = Colors.grey;
        break;
      case 'clear':
        icon = Icons.wb_sunny;
        color = Colors.orange;
        break;
      default:
        icon = Icons.wb_cloudy_outlined;
        color = AppColors.secondary;
    }
    return Icon(icon, color: color, size: 24);
  }
}
