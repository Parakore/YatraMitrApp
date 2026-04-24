import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service for handling lightweight key-value storage.
/// Used for app flags, settings, and simple user preferences.
class SharedPrefService {
  final SharedPreferences _prefs;

  SharedPrefService(this._prefs);

  /// Save string value
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// Get string value
  String? getString(String key) {
    return _prefs.getString(key);
  }

  /// Save boolean value
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Get boolean value
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  /// Remove value
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}

/// Provider for SharedPreferences instance
/// This should be overridden in ProviderScope with the actual instance
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

/// Provider for SharedPrefService
final sharedPrefServiceProvider = Provider<SharedPrefService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPrefService(prefs);
});
