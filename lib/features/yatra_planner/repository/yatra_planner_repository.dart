import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/yatra_plan.dart';
import '../service/yatra_planner_service.dart';
import '../service/groq_ai_service.dart';

/// Repository for Yatra Planner feature.
/// Coordinates between local storage and potential remote APIs.
class YatraPlannerRepository {
  final YatraPlannerLocalService _localService;
  final GroqAiService _aiService;

  YatraPlannerRepository(this._localService, this._aiService);

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

  /// Generates a dynamic AI itinerary using Groq.
  Future<List<YatraDayPlan>> generateAiItinerary(YatraPlan plan) async {
    return await _aiService.generateItinerary(plan);
  }
}

/// Provider for YatraPlannerLocalService
final yatraPlannerLocalServiceProvider = Provider<YatraPlannerLocalService>((ref) {
  return YatraPlannerLocalService();
});

/// Provider for YatraPlannerRepository
final yatraPlannerRepositoryProvider = Provider<YatraPlannerRepository>((ref) {
  final localService = ref.watch(yatraPlannerLocalServiceProvider);
  final aiService = ref.watch(groqAiServiceProvider);
  return YatraPlannerRepository(localService, aiService);
});
