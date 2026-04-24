// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowd_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CrowdStatusImpl _$$CrowdStatusImplFromJson(Map<String, dynamic> json) =>
    _$CrowdStatusImpl(
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      density: $enumDecode(_$CrowdDensityEnumMap, json['density']),
      waitTime: json['waitTime'] as String,
      suggestedTime: json['suggestedTime'] as String,
      currentCount: (json['currentCount'] as num?)?.toInt() ?? 0,
      maxCapacity: (json['maxCapacity'] as num?)?.toInt() ?? 0,
      trafficLevel: json['trafficLevel'] as String? ?? 'Normal',
    );

Map<String, dynamic> _$$CrowdStatusImplToJson(_$CrowdStatusImpl instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'density': _$CrowdDensityEnumMap[instance.density]!,
      'waitTime': instance.waitTime,
      'suggestedTime': instance.suggestedTime,
      'currentCount': instance.currentCount,
      'maxCapacity': instance.maxCapacity,
      'trafficLevel': instance.trafficLevel,
    };

const _$CrowdDensityEnumMap = {
  CrowdDensity.low: 'low',
  CrowdDensity.moderate: 'moderate',
  CrowdDensity.high: 'high',
};
