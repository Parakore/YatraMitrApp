import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yatramitra/features/disaster/view/disaster_screen.dart';
import '../../features/ai_assistant/view/ai_chat_screen.dart';
import '../../features/emergency/view/emergency_screen.dart';
import '../../features/emergency/view/incident_history_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/nearby/view/nearby_screen.dart';
import '../../features/crowd/view/crowd_intelligence_screen.dart';
import '../../features/home/view/dham_listing_screen.dart';
import '../../features/home/view/dham_detail_screen.dart';
import '../../features/notifications/view/notification_screen.dart';
import '../../features/home/view/quick_actions_screen.dart';
import '../../features/home/view/travel_essentials_screen.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/future_feature_screen.dart';

import '../../features/weather/view/weather_screen.dart';
import '../../features/maps/view/navigation_maps_screen.dart';
import '../../features/grievance/view/grievance_screen.dart';

/// Centralized router configuration for YatraMitra.
/// Mandatory: Use GoRouter ONLY.
class AppRouter {
  static const String home = '/';
  static const String nearby = '/nearby';
  static const String emergency = '/emergency';
  static const String emergencyHistory = '/emergency/history';
  static const String aiAssistant = '/ai-assistant';
  static const String offlineMaps = '/offline-maps';
  static const String yatraGuide = '/yatra-guide';
  static const String crowdIntelligence = '/crowd';
  static const String disasterAlerts = '/disaster';
  static const String weather = '/weather';
  static const String dhamListing = '/dham-listing';
  static const String dhamDetail = '/dham-detail/:id';
  static const String notifications = '/notifications';
  static const String quickActions = '/quick-actions';
  static const String travelEssentials = '/travel-essentials';

  static const String comingSoon = '/coming-soon';
  static const String grievance = '/grievance';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    errorBuilder: (context, state) => Scaffold(
      body: AppErrorWidget(
        errorMessage: 'Page not found: ${state.uri.path}',
        onRetry: () => context.go(home),
      ),
    ),
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: nearby,
        builder: (context, state) => const NearbyScreen(),
      ),
      GoRoute(
        path: emergency,
        builder: (context, state) => const EmergencyScreen(),
      ),
      GoRoute(
        path: emergencyHistory,
        builder: (context, state) => const IncidentHistoryScreen(),
      ),
      GoRoute(
        path: aiAssistant,
        builder: (context, state) => const AiChatScreen(),
      ),
      GoRoute(
        path: comingSoon,
        builder: (context, state) {
          final name = state.extra as String? ?? 'New Feature';
          return FutureFeatureScreen(featureName: name);
        },
      ),
      GoRoute(
        path: grievance,
        builder: (context, state) => const GrievanceScreen(),
      ),
      GoRoute(
        path: offlineMaps,
        builder: (context, state) => const NavigationMapsScreen(),
      ),
      GoRoute(
        path: yatraGuide,
        builder: (context, state) =>
            const PlaceholderScreen(title: 'Yatra Guide'),
      ),
      GoRoute(
        path: crowdIntelligence,
        builder: (context, state) => const CrowdIntelligenceScreen(),
      ),
      GoRoute(
        path: disasterAlerts,
        builder: (context, state) => const DisasterScreen(),
      ),
      GoRoute(
        path: weather,
        builder: (context, state) => const WeatherScreen(),
      ),
      GoRoute(
        path: dhamListing,
        builder: (context, state) => const DhamListingScreen(),
      ),
      GoRoute(
        path: dhamDetail,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'kedarnath';
          return DhamDetailScreen(dhamId: id);
        },
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: quickActions,
        builder: (context, state) => const QuickActionsScreen(),
      ),
      GoRoute(
        path: travelEssentials,
        builder: (context, state) => const TravelEssentialsScreen(),
      ),
    ],
  );
}

/// Temporary placeholder screen for unbuilt features.
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction_rounded,
                size: 64, color: Colors.orange),
            const SizedBox(height: 16),
            Text(
              '$title Feature Coming Soon',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
