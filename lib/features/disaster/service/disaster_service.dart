import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/hive_service.dart';
import '../model/disaster_models.dart';

/// Service for fetching and caching disaster intelligence data.
/// Follows offline-first approach: Cache -> API (Mock) -> Update Cache.
class DisasterService {
  final HiveService _hiveService;
  static const String _disasterBox = 'disaster_intelligence';
  static const String _summaryKey = 'summary_data';

  DisasterService(this._hiveService);

  /// Fetch disaster intelligence summary
  Future<DisasterIntelligenceSummary> fetchDisasterSummary() async {
    // 1. Load from cache first for offline-first support
    final cachedData = await _hiveService.getData<String>(_disasterBox, _summaryKey);
    DisasterIntelligenceSummary? summary;
    
    if (cachedData != null) {
      summary = DisasterIntelligenceSummary.fromJson(jsonDecode(cachedData));
    }

    try {
      // 2. Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      final mockData = _getMockSummary();
      
      // 3. Update cache
      await _hiveService.putData(_disasterBox, _summaryKey, jsonEncode(mockData.toJson()));
      
      return mockData;
    } catch (e) {
      // 4. Fallback to cache if API fails
      if (summary != null) {
        return summary;
      }
      rethrow;
    }
  }

  DisasterIntelligenceSummary _getMockSummary() {
    final now = DateTime.now();
    return DisasterIntelligenceSummary(
      routeStatuses: [
        RouteStatus(name: 'Kedarnath', status: 'CAUTION', lastUpdated: now),
        RouteStatus(name: 'Badrinath', status: 'OPEN', lastUpdated: now),
        RouteStatus(name: 'Yamunotri', status: 'CLOSED', lastUpdated: now),
        RouteStatus(name: 'Gangotri', status: 'OPEN', lastUpdated: now),
      ],
      weatherSummary: const WeatherSummary(
        temperature: 8.5,
        rainfall: 12.0,
        visibility: 'Moderate',
        condition: 'Cloudy with Light Rain',
      ),
      activeAlerts: [
        AlertModel(
          type: 'Landslide',
          location: 'Bhimbali Slope',
          severity: 'High',
          timestamp: now.subtract(const Duration(minutes: 15)),
          action: 'Avoid stopping in this stretch. Move quickly to safety zones.',
        ),
        AlertModel(
          type: 'Rain',
          location: 'Gaurikund',
          severity: 'Medium',
          timestamp: now.subtract(const Duration(hours: 1)),
          action: 'Heavy rain expected. Use rain protection and stay alert for flash floods.',
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
          riskExplanation: 'High risk of slippery paths due to continuous rain.',
          bestTravelWindow: 'Before 10:00 AM',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 1)),
          condition: 'Cloudy',
          temperature: 10.0,
          rainfall: 5.0,
          visibility: 'Moderate',
          trekStatus: 'Proceed',
          bestTravelWindow: '08:00 AM - 02:00 PM',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 2)),
          condition: 'Sunny',
          temperature: 14.0,
          rainfall: 0.0,
          visibility: 'Good',
          trekStatus: 'Proceed',
          bestTravelWindow: 'Anytime before sunset',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 3)),
          condition: 'Stormy',
          temperature: 6.0,
          rainfall: 25.0,
          visibility: 'Poor',
          trekStatus: 'Avoid',
          riskExplanation: 'Severe thunderstorm predicted. High danger of lightning and rockfall.',
        ),
        ForecastModel(
          date: now.add(const Duration(days: 4)),
          condition: 'Cloudy',
          temperature: 9.0,
          rainfall: 2.0,
          visibility: 'Moderate',
          trekStatus: 'Proceed',
        ),
      ],
      landslideZones: [
        const LandslideZone(id: 'LZ-001', location: 'Bhimbali-1', riskLevel: 'High', status: 'Active'),
        const LandslideZone(id: 'LZ-002', location: 'Jungle Chatti', riskLevel: 'Medium', status: 'Watch'),
        const LandslideZone(id: 'LZ-003', location: 'Linchauli', riskLevel: 'Low', status: 'Clear'),
      ],
      routeClosures: [
        const RouteClosure(
          routeName: 'Sonprayag - Gaurikund',
          status: 'Partial',
          reason: 'Maintenance due to minor rockfall',
          estimatedReopenTime: '6:00 PM Today',
        ),
      ],
      aiRecommendations: [
        'Start trek before 8 AM to avoid peak rain hours.',
        'Avoid Bhimbali slope after noon as visibility drops significantly.',
        'Carry rain protection and high-visibility gear.',
        'Keep extra buffer time for Sonprayag stretch due to partial closure.',
      ],
      lastUpdated: now,
    );
  }
}

/// Provider for DisasterService
final disasterServiceProvider = Provider<DisasterService>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  return DisasterService(hiveService);
});
