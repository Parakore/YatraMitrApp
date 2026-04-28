import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'yatra_plan.freezed.dart';
part 'yatra_plan.g.dart';

/// Model representing a pilgrim's comprehensive journey plan.
/// Matches the high-fidelity design requirements from yatra_planner.png.
@freezed
class YatraPlan with _$YatraPlan {
  @HiveType(typeId: 1, adapterName: 'YatraPlanAdapter')
  const factory YatraPlan({
    @HiveField(0) required String id,
    @HiveField(1) required String dhamName,
    @HiveField(2) required DateTime startDate,
    @HiveField(3) required int durationDays,
    @HiveField(4) required String startFrom,
    @HiveField(5) required List<String> dhamsToCover,
    @HiveField(6) required String ageGroup,
    @HiveField(7) required String fitnessLevel,
    @HiveField(8) required String accommodationType,
    @HiveField(9) required String budgetRange,
    @HiveField(10) String? specialNeeds,
    @HiveField(11) List<YatraDayPlan>? itinerary,
    @HiveField(12) @Default('Planned') String status,
    @HiveField(13) DateTime? createdAt,
  }) = _YatraPlan;

  factory YatraPlan.fromJson(Map<String, dynamic> json) => _$YatraPlanFromJson(json);
}

/// Detailed model representing a single day's plan in the itinerary.
@freezed
class YatraDayPlan with _$YatraDayPlan {
  @HiveType(typeId: 2, adapterName: 'YatraDayPlanAdapter')
  const factory YatraDayPlan({
    @HiveField(0) required int dayNumber,
    @HiveField(1) required DateTime date,
    @HiveField(2) required String route,
    @HiveField(3) required String distance,
    @HiveField(4) required String transport,
    @HiveField(5) required String accommodation,
    @HiveField(6) required String weather,
    @HiveField(7) required String crowdForecast,
    @HiveField(8) required String aiTip,
    @HiveField(9) @Default('Low') String riskLevel, // Low, Moderate, High
  }) = _YatraDayPlan;

  factory YatraDayPlan.fromJson(Map<String, dynamic> json) => _$YatraDayPlanFromJson(json);
}
