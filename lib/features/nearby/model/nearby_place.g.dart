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
      distanceInfo: json['distanceInfo'] as String,
      address: json['address'] as String,
      subInfo: json['subInfo'] as String,
      statusTag: json['statusTag'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      priceRange: json['priceRange'] as String?,
      isSafe: json['isSafe'] as bool? ?? false,
    );

Map<String, dynamic> _$$NearbyPlaceImplToJson(_$NearbyPlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'distanceInfo': instance.distanceInfo,
      'address': instance.address,
      'subInfo': instance.subInfo,
      'statusTag': instance.statusTag,
      'rating': instance.rating,
      'priceRange': instance.priceRange,
      'isSafe': instance.isSafe,
    };
