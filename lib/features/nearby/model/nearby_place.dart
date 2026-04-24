import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_place.freezed.dart';
part 'nearby_place.g.dart';

/// Model representing a nearby location or service.
@freezed
class NearbyPlace with _$NearbyPlace {
  const factory NearbyPlace({
    required String id,
    required String name,
    required String category,
    required String distanceInfo,
    required String address,
    required String subInfo,
    required String statusTag,
    @Default(0.0) double rating,
    String? priceRange,
    @Default(false) bool isSafe,
  }) = _NearbyPlace;

  factory NearbyPlace.fromJson(Map<String, dynamic> json) =>
      _$NearbyPlaceFromJson(json);
}
