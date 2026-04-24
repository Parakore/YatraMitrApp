import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/storage/hive_service.dart';
import 'core/storage/shared_pref_service.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_screen.dart';
// import 'features/nearby/view/nearby_screen.dart'; // Removed as unused in main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await HiveService.init();

  // Initialize SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const YatraMitraApp(),
    ),
  );
}

class YatraMitraApp extends StatelessWidget {
  const YatraMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YatraMitra',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
