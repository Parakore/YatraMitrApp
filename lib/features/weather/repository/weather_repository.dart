import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/weather_models.dart';
import '../service/weather_service.dart';
import '../../../core/storage/hive_service.dart';

class WeatherRepository {
  final WeatherService _weatherService;
  final HiveService _hiveService;
  final String _weatherBox = 'weather_box';
  WeatherRepository(this._weatherService, this._hiveService);

  Future<WeatherIntelligence> getWeatherIntelligence({
    required double lat,
    required double lon,
    String? locationName,
  }) async {
    final cacheKey = locationName != null
        ? 'weather_${locationName.toLowerCase().replaceAll(' ', '_')}'
        : 'weather_${lat.toStringAsFixed(2)}_${lon.toStringAsFixed(2)}';

    try {
      // 1. Fetch from API
      final currentData =
          await _weatherService.fetchCurrentWeather(lat: lat, lon: lon);
      final forecastData =
          await _weatherService.fetchForecast(lat: lat, lon: lon);

      // 2. Parse raw data
      final intelligence = _parseIntelligence(currentData, forecastData);

      // 3. Cache in Hive
      await _hiveService.putData(
          _weatherBox, cacheKey, jsonEncode(intelligence.toJson()));

      return intelligence;
    } catch (e) {
      // 4. On error (e.g. offline), try to return cached data
      try {
        final cachedJson =
            await _hiveService.getData<String>(_weatherBox, cacheKey);
        if (cachedJson != null) {
          return WeatherIntelligence.fromJson(jsonDecode(cachedJson));
        }
      } catch (cacheError) {
        // If cache is corrupted, clear it and rethrow original error
        await _hiveService.putData(_weatherBox, cacheKey, null);
      }
      rethrow;
    }
  }

  WeatherIntelligence _parseIntelligence(
      Map<String, dynamic> current, Map<String, dynamic> forecast) {
    // Safely parse current weather
    final main = current['main'] as Map<String, dynamic>?;
    final weatherList = current['weather'] as List<dynamic>?;
    final weather =
        (weatherList != null && weatherList.isNotEmpty) ? weatherList[0] : null;
    final wind = current['wind'] as Map<String, dynamic>?;

    // Visibility is optional in OWM API
    final visibilityVal = current['visibility'] as num?;
    final visibilityStr = visibilityVal != null
        ? '${(visibilityVal / 1000).toStringAsFixed(1)} km'
        : 'Clear';

    // Handle both rain and snow
    final rain = current['rain'] as Map<String, dynamic>?;
    final snow = current['snow'] as Map<String, dynamic>?;
    final precipitation =
        (rain?['1h'] as num? ?? snow?['1h'] as num?)?.toDouble() ?? 0.0;

    final currentWeather = WeatherModel(
      temperature: (main?['temp'] as num? ?? 0.0).toDouble(),
      condition: weather?['main'] ?? 'Unknown',
      description: weather?['description'] ?? 'No description available',
      rainfall: precipitation,
      windSpeed: (wind?['speed'] as num? ?? 0.0).toDouble(),
      humidity: (main?['humidity'] as num? ?? 0).toInt(),
      visibility: visibilityStr,
      timestamp: DateTime.now(),
      location: current['name'] ?? 'Unknown Location',
    );

    final List<dynamic> forecastList = forecast['list'] ?? [];
    final forecasts = forecastList.take(5).map((f) {
      final fMain = f['main'] as Map<String, dynamic>?;
      final fWeatherList = f['weather'] as List<dynamic>?;
      final fWeather = (fWeatherList != null && fWeatherList.isNotEmpty)
          ? fWeatherList[0]
          : null;
      final fRain = f['rain'] as Map<String, dynamic>?;
      final fSnow = f['snow'] as Map<String, dynamic>?;

      return ForecastModel(
        date:
            DateTime.fromMillisecondsSinceEpoch((f['dt'] as int? ?? 0) * 1000),
        temperature: (fMain?['temp'] as num? ?? 0.0).toDouble(),
        condition: fWeather?['main'] ?? 'Unknown',
        rainfall:
            (fRain?['3h'] as num? ?? fSnow?['3h'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();

    // AI Intelligence Logic
    String riskLevel = 'Low';
    String recommendation = 'Safe to proceed with caution';
    List<String> tips = [
      'Start early to reach the next base camp by afternoon'
    ];

    if (currentWeather.rainfall > 10 ||
        currentWeather.condition.toLowerCase().contains('snow')) {
      riskLevel = 'Medium';
      recommendation = 'Proceed with extra caution - Precipitation reported';
      tips.add('Ensure you have waterproof gear and stable footwear');
    }

    if (currentWeather.rainfall > 25 ||
        currentWeather.condition.toLowerCase().contains('storm')) {
      riskLevel = 'High';
      recommendation = 'Avoid travel - Severe weather reported';
      tips.add('Seek shelter immediately and wait for weather clearance');
    }

    if (currentWeather.temperature < 5) {
      tips.add('Extreme cold - Wear layered thermal clothing');
    }

    if (currentWeather.windSpeed > 20) {
      tips.add('High winds - Stay away from loose structures and ridges');
    }

    return WeatherIntelligence(
      current: currentWeather,
      forecasts: forecasts,
      safetyRecommendation: recommendation,
      tips: tips,
      riskLevel: riskLevel,
    );
  }
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final weatherService = ref.watch(weatherServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return WeatherRepository(weatherService, hiveService);
});
