import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service for handling local Hive database operations.
/// Supports structured data caching for offline-first functionality.
class HiveService {
  /// Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    // Register adapters here in the future
    // Hive.registerAdapter(PlaceAdapter());
  }

  /// Open a box
  Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  /// Save data to a box
  Future<void> putData<T>(String boxName, String key, T data) async {
    final box = await openBox<T>(boxName);
    await box.put(key, data);
  }

  /// Get data from a box
  Future<T?> getData<T>(String boxName, String key) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  /// Clear a box
  Future<void> clearBox(String boxName) async {
    final box = await Hive.openBox(boxName);
    await box.clear();
  }
}

/// Provider for HiveService
final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
