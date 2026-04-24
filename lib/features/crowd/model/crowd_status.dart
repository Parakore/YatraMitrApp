import 'package:freezed_annotation/freezed_annotation.dart';

part 'crowd_status.freezed.dart';
part 'crowd_status.g.dart';

@freezed
class CrowdStatus with _$CrowdStatus {
  const factory CrowdStatus({
    required String locationId,
    required String locationName,
    required CrowdDensity density,
    required String waitTime,
    required String suggestedTime,
    @Default(0) int currentCount,
    @Default(0) int maxCapacity,
    @Default('Normal') String trafficLevel,
  }) = _CrowdStatus;

  factory CrowdStatus.fromJson(Map<String, dynamic> json) => _$CrowdStatusFromJson(json);
}

enum CrowdDensity { low, moderate, high }
