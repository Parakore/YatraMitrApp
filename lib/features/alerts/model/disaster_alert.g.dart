// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disaster_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisasterAlertImpl _$$DisasterAlertImplFromJson(Map<String, dynamic> json) =>
    _$DisasterAlertImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      severity: $enumDecode(_$AlertSeverityEnumMap, json['severity']),
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String? ?? 'Route 1',
      isLive: json['isLive'] as bool? ?? true,
    );

Map<String, dynamic> _$$DisasterAlertImplToJson(_$DisasterAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
      'location': instance.location,
      'isLive': instance.isLive,
    };

const _$AlertSeverityEnumMap = {
  AlertSeverity.low: 'low',
  AlertSeverity.medium: 'medium',
  AlertSeverity.high: 'high',
};
