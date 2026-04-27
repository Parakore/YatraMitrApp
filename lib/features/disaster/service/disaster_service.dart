import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/core/storage/hive_service.dart';

import '../../../core/constants/app_constants.dart';
import '../../weather/service/weather_service.dart';
import '../model/disaster_models.dart';

/// Service for fetching and caching disaster intelligence data.
/// Follows offline-first approach: Cache -> API (Real + Mock) -> Update Cache.
class DisasterService {
  final HiveService _hiveService;
  final WeatherService _weatherService;
  static const String _disasterBox = 'disaster_intelligence';
  static const String _summaryKey = 'summary_data';

  DisasterService(this._hiveService, this._weatherService);

  /// Fetch disaster intelligence summary
  Future<DisasterIntelligenceSummary> fetchDisasterSummary() async {
    // 1. Load from cache first for offline-first support
    final cachedData =
        await _hiveService.getData<String>(_disasterBox, _summaryKey);
    DisasterIntelligenceSummary? cachedSummary;

    if (cachedData != null) {
      cachedSummary =
          DisasterIntelligenceSummary.fromJson(jsonDecode(cachedData));
    }

    try {
      // 2. Fetch real weather and forecast data
      final currentWeather = await _weatherService.fetchCurrentWeather(
        lat: AppConstants.kedarnathLat,
        lon: AppConstants.kedarnathLon,
      );

      final forecastData = await _weatherService.fetchForecast(
        lat: AppConstants.kedarnathLat,
        lon: AppConstants.kedarnathLon,
      );

      // 3. Map to Disaster Intelligence models
      final weatherSummary = _mapToWeatherSummary(currentWeather);
      final fiveDayForecast = _mapToForecastList(forecastData);

      // 4. Combine with simulated disaster-specific data (Alerts, Zones, Closures)
      final mockBase = _getMockSummary();

      final summary = mockBase.copyWith(
        weatherSummary: weatherSummary,
        fiveDayForecast: fiveDayForecast,
        lastUpdated: DateTime.now(),
      );

      // 5. Update cache
      await _hiveService.putData(
          _disasterBox, _summaryKey, jsonEncode(summary.toJson()));

      return summary;
    } catch (e) {
      // 6. Fallback to cache if API fails
      if (cachedSummary != null) {
        return cachedSummary;
      }
      rethrow;
    }
  }

  WeatherSummary _mapToWeatherSummary(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List).first as Map<String, dynamic>;
    final visibilityMeters = json['visibility'] as int? ?? 10000;
    final rain = json['rain'] as Map<String, dynamic>?;

    String visibilityLabel = 'Good';
    if (visibilityMeters < 2000) {
      visibilityLabel = 'Poor';
    } else if (visibilityMeters < 5000) {
      visibilityLabel = 'Moderate';
    }

    return WeatherSummary(
      temperature: (main['temp'] as num).toDouble(),
      rainfall: (rain?['1h'] as num?)?.toDouble() ?? 0.0,
      visibility: visibilityLabel,
      condition: weather['main'] as String,
    );
  }

  List<ForecastModel> _mapToForecastList(Map<String, dynamic> json) {
    final list = json['list'] as List;
    final forecasts = <ForecastModel>[];

    // We take one forecast per day (every 8th item as OpenWeather gives 3h intervals)
    for (int i = 0; i < list.length; i += 8) {
      final item = list[i] as Map<String, dynamic>;
      final main = item['main'] as Map<String, dynamic>;
      final weather = (item['weather'] as List).first as Map<String, dynamic>;
      final rain = item['rain'] as Map<String, dynamic>?;
      final visibilityMeters = item['visibility'] as int? ?? 10000;

      String visibilityLabel = 'Good';
      if (visibilityMeters < 2000) {
        visibilityLabel = 'Poor';
      } else if (visibilityMeters < 5000) {
        visibilityLabel = 'Moderate';
      }

      final condition = weather['main'] as String;
      String trekStatus = 'Proceed';
      String? riskExplanation;

      if (condition.toLowerCase().contains('rain') ||
          condition.toLowerCase().contains('storm')) {
        trekStatus = 'Caution';
        riskExplanation = 'Slippery paths due to precipitation.';
      }

      forecasts.add(ForecastModel(
        date: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
        condition: condition,
        temperature: (main['temp'] as num).toDouble(),
        rainfall: (rain?['3h'] as num?)?.toDouble() ?? 0.0,
        visibility: visibilityLabel,
        trekStatus: trekStatus,
        riskExplanation: riskExplanation,
        bestTravelWindow: 'Early Morning',
      ));
    }

    return forecasts.take(5).toList();
  }

  DisasterIntelligenceSummary _getMockSummary() {
    final now = DateTime.now();
    return DisasterIntelligenceSummary(
      routeStatuses: [
        RouteStatus(
            name: 'Kedarnath',
            status: 'CAUTION',
            lastUpdated: now.subtract(const Duration(minutes: 5))),
        RouteStatus(
            name: 'Badrinath',
            status: 'OPEN',
            lastUpdated: now.subtract(const Duration(minutes: 12))),
        RouteStatus(
            name: 'Yamunotri',
            status: 'CLOSED',
            lastUpdated: now.subtract(const Duration(hours: 2))),
        RouteStatus(
            name: 'Gangotri',
            status: 'OPEN',
            lastUpdated: now.subtract(const Duration(minutes: 45))),
      ],
      weatherSummary: const WeatherSummary(
        temperature: 7.2,
        rainfall: 14.5,
        visibility: 'Poor',
        condition: 'Heavy Fog & Drizzle',
      ),
      activeAlerts: [
        AlertModel(
          type: 'Landslide',
          location: 'Bhimbali Slope',
          severity: 'High',
          timestamp: now.subtract(const Duration(minutes: 15)),
          action:
              'Avoid stopping in this stretch. Move quickly to safety zones.',
        ),
        AlertModel(
          type: 'Flash Flood',
          location: 'Mandakini River Bank',
          severity: 'Critical',
          timestamp: now.subtract(const Duration(minutes: 5)),
          action: 'Immediate evacuation of lower banks. Move to higher ground.',
        ),
        AlertModel(
          type: 'Rockfall',
          location: 'Jungle Chatti',
          severity: 'Medium',
          timestamp: now.subtract(const Duration(minutes: 40)),
          action: 'Wear helmets and follow porter instructions strictly.',
        ),
        AlertModel(
          type: 'Rain',
          location: 'Gaurikund',
          severity: 'Medium',
          timestamp: now.subtract(const Duration(hours: 1)),
          action: 'Heavy rain expected. Use rain protection and stay alert.',
        ),
      ],
      fiveDayForecast: [
        ForecastModel(
          date: now,
          condition: 'Rainy',
          temperature: 8.0,
          rainfall: 15.0,
          visibility: 'Poor',
          trekStatus: 'Caution',
          riskExplanation:
              'High risk of slippery paths due to continuous rain.',
          bestTravelWindow: 'Before 10:00 AM',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 1)),
          condition: 'Heavy Rain',
          temperature: 6.0,
          rainfall: 35.0,
          visibility: 'Very Poor',
          trekStatus: 'Avoid',
          riskExplanation: 'Flash flood warning issued for Rambara area.',
          bestTravelWindow: 'Stay Indoors',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 2)),
          condition: 'Cloudy',
          temperature: 11.0,
          rainfall: 4.0,
          visibility: 'Moderate',
          trekStatus: 'Proceed',
          bestTravelWindow: '09:00 AM - 01:00 PM',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 3)),
          condition: 'Sunny',
          temperature: 15.0,
          rainfall: 0.0,
          visibility: 'Good',
          trekStatus: 'Proceed',
          bestTravelWindow: 'Anytime before sunset',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 4)),
          condition: 'Stormy',
          temperature: 5.0,
          rainfall: 28.0,
          visibility: 'Poor',
          trekStatus: 'Avoid',
          riskExplanation: 'Severe lightning predicted above 3000m.',
        ),
      ],
      landslideZones: [
        const LandslideZone(
            id: 'LZ-001',
            location: 'Bhimbali-1',
            riskLevel: 'High',
            status: 'Active'),
        const LandslideZone(
            id: 'LZ-002',
            location: 'Jungle Chatti',
            riskLevel: 'Medium',
            status: 'Watch'),
        const LandslideZone(
            id: 'LZ-003',
            location: 'Linchauli',
            riskLevel: 'High',
            status: 'Active'),
        const LandslideZone(
            id: 'LZ-004',
            location: 'Rambara Bridge',
            riskLevel: 'Low',
            status: 'Clear'),
      ],
      routeClosures: [
        const RouteClosure(
          routeName: 'Sonprayag - Gaurikund',
          status: 'Partial',
          reason: 'Maintenance due to minor rockfall',
          estimatedReopenTime: '6:00 PM Today',
        ),
        const RouteClosure(
          routeName: 'Linchauri Upper Trail',
          status: 'Full',
          reason: 'Snow accumulation and black ice',
          estimatedReopenTime: 'Tomorrow 10 AM',
        ),
      ],
      aiRecommendations: [
        'Start trek before 7 AM to avoid peak afternoon convection rain.',
        'Emergency shelter available every 2km at designated yellow markers.',
        'Avoid Bhimbali slope after noon as visibility drops to <500m.',
        'Carry high-calorie food; temp drops expected to reach 2°C tonight.',
        'Offline maps updated. Recalculate route via Jungle Chatti bypass.',
      ],
      lastUpdated: now,
    );
  }
}

/// Provider for DisasterService
final disasterServiceProvider = Provider<DisasterService>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final weatherService = ref.watch(weatherServiceProvider);
  return DisasterService(hiveService, weatherService);
});
