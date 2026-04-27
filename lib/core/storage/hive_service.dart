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
  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  /// Save data to a box
  Future<void> putData(String boxName, String key, dynamic data) async {
    final box = await openBox(boxName);
    await box.put(key, data);
  }

  /// Get data from a box
  Future<T?> getData<T>(String boxName, String key) async {
    final box = await openBox(boxName);
    final data = box.get(key);
    if (data == null) return null;
    if (data is T) return data;
    
    // Handle List casting specifically for Hive
    if (T.toString().startsWith('List') && data is List) {
      return data as T;
    }
    
    return null;
  }

  /// Clear a box
  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }
}

/// Provider for HiveService
final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
