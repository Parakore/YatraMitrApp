import 'package:freezed_annotation/freezed_annotation.dart';

part 'disaster_models.freezed.dart';
part 'disaster_models.g.dart';

@freezed
class RouteStatus with _$RouteStatus {
  const factory RouteStatus({
    required String name,
    required String status, // OPEN, CAUTION, CLOSED
    required DateTime lastUpdated,
  }) = _RouteStatus;

  factory RouteStatus.fromJson(Map<String, dynamic> json) => _$RouteStatusFromJson(json);
}

@freezed
class WeatherSummary with _$WeatherSummary {
  const factory WeatherSummary({
    required double temperature,
    required double rainfall,
    required String visibility, // Good, Moderate, Poor
    required String condition,
  }) = _WeatherSummary;

  factory WeatherSummary.fromJson(Map<String, dynamic> json) => _$WeatherSummaryFromJson(json);
}

@freezed
class AlertModel with _$AlertModel {
  const factory AlertModel({
    required String type, // Landslide, Rain, Closure, Flood
    required String location,
    required String severity, // Low, Medium, High
    required DateTime timestamp,
    required String action,
    double? distance, // For location-based alerts
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) => _$AlertModelFromJson(json);
}

@freezed
class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    required DateTime date,
    required String condition,
    required double temperature,
    required double rainfall,
    required String visibility,
    required String trekStatus, // Proceed, Caution, Avoid
    String? riskExplanation,
    String? bestTravelWindow,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);
}

@freezed
class LandslideZone with _$LandslideZone {
  const factory LandslideZone({
    required String id,
    required String location,
    required String riskLevel, // Low, Medium, High
    required String status, // Clear, Watch, Active
  }) = _LandslideZone;

  factory LandslideZone.fromJson(Map<String, dynamic> json) => _$LandslideZoneFromJson(json);
}

@freezed
class RouteClosure with _$RouteClosure {
  const factory RouteClosure({
    required String routeName,
    required String status, // Open, Partial, Closed
    required String reason,
    String? estimatedReopenTime,
  }) = _RouteClosure;

  factory RouteClosure.fromJson(Map<String, dynamic> json) => _$RouteClosureFromJson(json);
}

@freezed
class DisasterIntelligenceSummary with _$DisasterIntelligenceSummary {
  const factory DisasterIntelligenceSummary({
    required List<RouteStatus> routeStatuses,
    required WeatherSummary weatherSummary,
    required List<AlertModel> activeAlerts,
    required List<ForecastModel> fiveDayForecast,
    required List<LandslideZone> landslideZones,
    required List<RouteClosure> routeClosures,
    required List<String> aiRecommendations,
    required DateTime lastUpdated,
  }) = _DisasterIntelligenceSummary;

  factory DisasterIntelligenceSummary.fromJson(Map<String, dynamic> json) => _$DisasterIntelligenceSummaryFromJson(json);
}
