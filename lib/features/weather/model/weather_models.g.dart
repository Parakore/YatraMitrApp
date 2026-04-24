// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      description: json['description'] as String,
      rainfall: (json['rainfall'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      visibility: json['visibility'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'condition': instance.condition,
      'description': instance.description,
      'rainfall': instance.rainfall,
      'windSpeed': instance.windSpeed,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'timestamp': instance.timestamp.toIso8601String(),
      'location': instance.location,
    };

_$ForecastModelImpl _$$ForecastModelImplFromJson(Map<String, dynamic> json) =>
    _$ForecastModelImpl(
      date: DateTime.parse(json['date'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      rainfall: (json['rainfall'] as num).toDouble(),
    );

Map<String, dynamic> _$$ForecastModelImplToJson(_$ForecastModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'temperature': instance.temperature,
      'condition': instance.condition,
      'rainfall': instance.rainfall,
    };

_$WeatherIntelligenceImpl _$$WeatherIntelligenceImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherIntelligenceImpl(
      current: WeatherModel.fromJson(json['current'] as Map<String, dynamic>),
      forecasts: (json['forecasts'] as List<dynamic>)
          .map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      safetyRecommendation: json['safetyRecommendation'] as String,
      tips: (json['tips'] as List<dynamic>).map((e) => e as String).toList(),
      riskLevel: json['riskLevel'] as String,
    );

Map<String, dynamic> _$$WeatherIntelligenceImplToJson(
        _$WeatherIntelligenceImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'forecasts': instance.forecasts,
      'safetyRecommendation': instance.safetyRecommendation,
      'tips': instance.tips,
      'riskLevel': instance.riskLevel,
    };
