// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disaster_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteStatusImpl _$$RouteStatusImplFromJson(Map<String, dynamic> json) =>
    _$RouteStatusImpl(
      name: json['name'] as String,
      status: json['status'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$RouteStatusImplToJson(_$RouteStatusImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_$WeatherSummaryImpl _$$WeatherSummaryImplFromJson(Map<String, dynamic> json) =>
    _$WeatherSummaryImpl(
      temperature: (json['temperature'] as num).toDouble(),
      rainfall: (json['rainfall'] as num).toDouble(),
      visibility: json['visibility'] as String,
      condition: json['condition'] as String,
    );

Map<String, dynamic> _$$WeatherSummaryImplToJson(
        _$WeatherSummaryImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'rainfall': instance.rainfall,
      'visibility': instance.visibility,
      'condition': instance.condition,
    };

_$AlertModelImpl _$$AlertModelImplFromJson(Map<String, dynamic> json) =>
    _$AlertModelImpl(
      type: json['type'] as String,
      location: json['location'] as String,
      severity: json['severity'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      action: json['action'] as String,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AlertModelImplToJson(_$AlertModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'location': instance.location,
      'severity': instance.severity,
      'timestamp': instance.timestamp.toIso8601String(),
      'action': instance.action,
      'distance': instance.distance,
    };

_$ForecastModelImpl _$$ForecastModelImplFromJson(Map<String, dynamic> json) =>
    _$ForecastModelImpl(
      date: DateTime.parse(json['date'] as String),
      condition: json['condition'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      rainfall: (json['rainfall'] as num).toDouble(),
      visibility: json['visibility'] as String,
      trekStatus: json['trekStatus'] as String,
      riskExplanation: json['riskExplanation'] as String?,
      bestTravelWindow: json['bestTravelWindow'] as String?,
    );

Map<String, dynamic> _$$ForecastModelImplToJson(_$ForecastModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'condition': instance.condition,
      'temperature': instance.temperature,
      'rainfall': instance.rainfall,
      'visibility': instance.visibility,
      'trekStatus': instance.trekStatus,
      'riskExplanation': instance.riskExplanation,
      'bestTravelWindow': instance.bestTravelWindow,
    };

_$LandslideZoneImpl _$$LandslideZoneImplFromJson(Map<String, dynamic> json) =>
    _$LandslideZoneImpl(
      id: json['id'] as String,
      location: json['location'] as String,
      riskLevel: json['riskLevel'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$LandslideZoneImplToJson(_$LandslideZoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'riskLevel': instance.riskLevel,
      'status': instance.status,
    };

_$RouteClosureImpl _$$RouteClosureImplFromJson(Map<String, dynamic> json) =>
    _$RouteClosureImpl(
      routeName: json['routeName'] as String,
      status: json['status'] as String,
      reason: json['reason'] as String,
      estimatedReopenTime: json['estimatedReopenTime'] as String?,
    );

Map<String, dynamic> _$$RouteClosureImplToJson(_$RouteClosureImpl instance) =>
    <String, dynamic>{
      'routeName': instance.routeName,
      'status': instance.status,
      'reason': instance.reason,
      'estimatedReopenTime': instance.estimatedReopenTime,
    };

_$DisasterIntelligenceSummaryImpl _$$DisasterIntelligenceSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DisasterIntelligenceSummaryImpl(
      routeStatuses: (json['routeStatuses'] as List<dynamic>)
          .map((e) => RouteStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      weatherSummary: WeatherSummary.fromJson(
          json['weatherSummary'] as Map<String, dynamic>),
      activeAlerts: (json['activeAlerts'] as List<dynamic>)
          .map((e) => AlertModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fiveDayForecast: (json['fiveDayForecast'] as List<dynamic>)
          .map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      landslideZones: (json['landslideZones'] as List<dynamic>)
          .map((e) => LandslideZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeClosures: (json['routeClosures'] as List<dynamic>)
          .map((e) => RouteClosure.fromJson(e as Map<String, dynamic>))
          .toList(),
      aiRecommendations: (json['aiRecommendations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$DisasterIntelligenceSummaryImplToJson(
        _$DisasterIntelligenceSummaryImpl instance) =>
    <String, dynamic>{
      'routeStatuses': instance.routeStatuses,
      'weatherSummary': instance.weatherSummary,
      'activeAlerts': instance.activeAlerts,
      'fiveDayForecast': instance.fiveDayForecast,
      'landslideZones': instance.landslideZones,
      'routeClosures': instance.routeClosures,
      'aiRecommendations': instance.aiRecommendations,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
