import 'package:hive_flutter/hive_flutter.dart';
import '../model/yatra_plan.dart';

/// Service for managing local storage of Yatra plans using Hive.
class YatraPlannerLocalService {
  static const String boxName = 'yatra_plans_v2_box';

  /// Saves a new plan or updates an existing one.
  Future<void> savePlan(YatraPlan plan) async {
    final box = await Hive.openBox<YatraPlan>(boxName);
    await box.put(plan.id, plan);
  }

  /// Retrieves all saved plans.
  Future<List<YatraPlan>> getAllPlans() async {
    final box = await Hive.openBox<YatraPlan>(boxName);
    return box.values.toList();
  }

  /// Deletes a plan by ID.
  Future<void> deletePlan(String id) async {
    final box = await Hive.openBox<YatraPlan>(boxName);
    await box.delete(id);
  }

  /// Clears all plans.
  Future<void> clearAllPlans() async {
    final box = await Hive.openBox<YatraPlan>(boxName);
    await box.clear();
  }
}
