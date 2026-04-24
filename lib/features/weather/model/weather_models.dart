import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_models.freezed.dart';
part 'weather_models.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required double temperature,
    required String condition,
    required String description,
    required double rainfall,
    required double windSpeed,
    required int humidity,
    required String visibility,
    required DateTime timestamp,
    required String location,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@freezed
class ForecastModel with _$ForecastModel {
  const factory ForecastModel({
    required DateTime date,
    required double temperature,
    required String condition,
    required double rainfall,
  }) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);
}

@freezed
class WeatherIntelligence with _$WeatherIntelligence {
  const factory WeatherIntelligence({
    required WeatherModel current,
    required List<ForecastModel> forecasts,
    required String safetyRecommendation,
    required List<String> tips,
    required String riskLevel, // Low, Medium, High
  }) = _WeatherIntelligence;

  factory WeatherIntelligence.fromJson(Map<String, dynamic> json) => _$WeatherIntelligenceFromJson(json);
}
