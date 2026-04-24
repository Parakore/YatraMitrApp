import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/weather_models.dart';
import '../service/weather_service.dart';
import '../../../core/storage/hive_service.dart';

class WeatherRepository {
  final WeatherService _weatherService;
  final HiveService _hiveService;
  final String _weatherBox = 'weather_box';
  final String _weatherKey = 'current_intelligence';

  WeatherRepository(this._weatherService, this._hiveService);

  Future<WeatherIntelligence> getWeatherIntelligence({
    required double lat,
    required double lon,
  }) async {
    try {
      // 1. Fetch from API
      final currentData = await _weatherService.fetchCurrentWeather(lat: lat, lon: lon);
      final forecastData = await _weatherService.fetchForecast(lat: lat, lon: lon);

      // 2. Parse raw data
      final intelligence = _parseIntelligence(currentData, forecastData);

      // 3. Cache in Hive
      await _hiveService.putData(_weatherBox, _weatherKey, jsonEncode(intelligence.toJson()));

      return intelligence;
    } catch (e) {
      // 4. On error (e.g. offline), try to return cached data
      final cachedJson = await _hiveService.getData<String>(_weatherBox, _weatherKey);
      if (cachedJson != null) {
        return WeatherIntelligence.fromJson(jsonDecode(cachedJson));
      }
      rethrow;
    }
  }

  WeatherIntelligence _parseIntelligence(Map<String, dynamic> current, Map<String, dynamic> forecast) {
    final currentWeather = WeatherModel(
      temperature: (current['main']['temp'] as num).toDouble(),
      condition: current['weather'][0]['main'],
      description: current['weather'][0]['description'],
      rainfall: (current['rain']?['1h'] as num?)?.toDouble() ?? 0.0,
      windSpeed: (current['wind']['speed'] as num).toDouble(),
      humidity: (current['main']['humidity'] as num).toInt(),
      visibility: '${((current['visibility'] as num) / 1000).toStringAsFixed(1)} km',
      timestamp: DateTime.now(),
      location: current['name'] ?? 'Unknown',
    );

    final List<dynamic> forecastList = forecast['list'];
    final forecasts = forecastList.take(5).map((f) {
      return ForecastModel(
        date: DateTime.fromMillisecondsSinceEpoch(f['dt'] * 1000),
        temperature: (f['main']['temp'] as num).toDouble(),
        condition: f['weather'][0]['main'],
        rainfall: (f['rain']?['3h'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();

    // AI Intelligence Logic
    String riskLevel = 'Low';
    String recommendation = 'Safe to proceed';
    List<String> tips = ['Start early to reach the next base camp by afternoon'];

    if (currentWeather.rainfall > 20) {
      riskLevel = 'High';
      recommendation = 'Avoid travel - Heavy rain reported';
      tips.add('Seek shelter immediately and stay updated with local reports');
    } else if (currentWeather.rainfall > 5 || currentWeather.condition.toLowerCase().contains('storm')) {
      riskLevel = 'Medium';
      recommendation = 'Proceed with caution';
      tips.add('Carry a heavy-duty raincoat and waterproof gear');
    }

    if (currentWeather.temperature < 5) {
      tips.add('Extreme cold - Wear layered woolen clothing');
    }

    if (currentWeather.windSpeed > 15) {
      tips.add('High winds - Avoid walking near open ridges');
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
