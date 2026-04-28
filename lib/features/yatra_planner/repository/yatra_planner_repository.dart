import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/yatra_plan.dart';
import '../service/yatra_planner_service.dart';

/// Repository for Yatra Planner feature.
/// Coordinates between local storage and potential remote APIs.
class YatraPlannerRepository {
  final YatraPlannerLocalService _localService;

  YatraPlannerRepository(this._localService);

  /// Saves a plan locally.
  Future<void> savePlan(YatraPlan plan) async {
    await _localService.savePlan(plan);
  }

  /// Fetches all plans from local storage.
  Future<List<YatraPlan>> getPlans() async {
    return await _localService.getAllPlans();
  }

  /// Deletes a plan.
  Future<void> deletePlan(String id) async {
    await _localService.deletePlan(id);
  }
}

/// Provider for YatraPlannerLocalService
final yatraPlannerLocalServiceProvider = Provider<YatraPlannerLocalService>((ref) {
  return YatraPlannerLocalService();
});

/// Provider for YatraPlannerRepository
final yatraPlannerRepositoryProvider = Provider<YatraPlannerRepository>((ref) {
  final localService = ref.watch(yatraPlannerLocalServiceProvider);
  return YatraPlannerRepository(localService);
});
