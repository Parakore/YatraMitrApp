// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyPlaceImpl _$$NearbyPlaceImplFromJson(Map<String, dynamic> json) =>
    _$NearbyPlaceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      distance: (json['distance'] as num).toDouble(),
      address: json['address'] as String,
      isSafe: json['isSafe'] as bool? ?? false,
    );

Map<String, dynamic> _$$NearbyPlaceImplToJson(_$NearbyPlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'distance': instance.distance,
      'address': instance.address,
      'isSafe': instance.isSafe,
    };
