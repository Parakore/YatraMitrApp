import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yatramitra/core/theme/app_colors.dart';
import 'package:yatramitra/features/disaster/view/disaster_screen.dart';
import 'package:yatramitra/features/home/view/essential_detail_screen.dart';
import 'package:yatramitra/features/yatra_planner/view/yatra_planner_screen.dart';
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
import '../../features/grievance/view/grievance_detail_screen.dart';
import '../../features/grievance/model/grievance_model.dart';
import '../../features/registration/view/yatra_registration_screen.dart';
import '../../features/home/model/home_models.dart';
import '../../features/maps/view/safety_vitals_screen.dart';
import '../../features/maps/view/geo_fencing_screen.dart';
import '../../features/registration/view/my_registration_screen.dart';

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
  static const String grievanceDetail = '/grievance-detail';
  static const String registration = '/registration';
  static const String myRegistration = '/my-registration';
  static const String yatraPlanner = '/yatra-planner';
  static const String safetyVitals = '/safety-vitals';
  static const String geoFencing = '/geo-fencing';

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
        builder: (context, state) {
          final initialMessage = state.extra as String?;
          return AiChatScreen(initialMessage: initialMessage);
        },
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
        path: grievanceDetail,
        builder: (context, state) {
          final grievance = state.extra as Grievance;
          return GrievanceDetailScreen(grievance: grievance);
        },
      ),
      GoRoute(
        path: offlineMaps,
        builder: (context, state) => const NavigationMapsScreen(),
      ),
      GoRoute(
        path: yatraGuide,
        builder: (context, state) {
          final essential = state.extra as TravelEssential?;
          if (essential == null) {
            return const PlaceholderScreen(title: 'Yatra Guide');
          }
          return EssentialDetailScreen(
            essential: essential,
            details: _getDummyDetails(essential.category),
          );
        },
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
      GoRoute(
        path: registration,
        builder: (context, state) => const YatraRegistrationScreen(),
      ),
      GoRoute(
        path: myRegistration,
        builder: (context, state) => const MyRegistrationScreen(),
      ),
      GoRoute(
        path: yatraPlanner,
        builder: (context, state) => const YatraPlannerScreen(),
      ),
      GoRoute(
        path: safetyVitals,
        builder: (context, state) => const SafetyVitalsScreen(),
      ),
      GoRoute(
        path: geoFencing,
        builder: (context, state) => const GeoFencingScreen(),
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

/// Helper to generate premium dummy data for Travel Essentials.
TravelEssentialDetail _getDummyDetails(EssentialCategory category) {
  switch (category) {
    case EssentialCategory.health:
      return const TravelEssentialDetail(
        title: 'Health & Wellness Guide',
        description:
            'Maintaining your health at high altitudes is critical for a safe Yatra. Follow these essential tips to stay fit and energized.',
        sections: [
          EssentialSection(
            title: 'Altitude Sickness (AMS)',
            content:
                'Ascend slowly. If you feel headache or nausea, descend immediately. Drink 4-5 liters of water daily.',
            icon: Icons.terrain_rounded,
            accentColor: AppColors.error,
          ),
          EssentialSection(
            title: 'Hydration & Nutrition',
            content:
                'Carry energetic snacks like dark chocolate, nuts, and glucose. Avoid heavy meals before trekking.',
            icon: Icons.water_drop_rounded,
            accentColor: AppColors.primary,
          ),
          EssentialSection(
            title: 'Hygiene Practices',
            content:
                'Use hand sanitizers frequently. Drink only boiled or bottled water to avoid stomach infections.',
            icon: Icons.clean_hands_rounded,
            accentColor: AppColors.success,
          ),
        ],
      );
    case EssentialCategory.packing:
      return const TravelEssentialDetail(
        title: 'Essential Packing List',
        description:
            'A well-packed bag is the key to a comfortable trek. Check off these items as you prepare for your journey.',
        sections: [],
        checklist: [
          ChecklistItem(item: 'Heavy Woolen Jacket', category: 'Clothing'),
          ChecklistItem(item: 'Thermal Innerwear', category: 'Clothing'),
          ChecklistItem(item: 'Raincoat/Poncho', category: 'Clothing'),
          ChecklistItem(item: 'Sturdy Trekking Boots', category: 'Footwear'),
          ChecklistItem(item: 'Woolen Socks (3 pairs)', category: 'Footwear'),
          ChecklistItem(item: 'Personal Medications', category: 'Medical'),
          ChecklistItem(item: 'First-Aid Kit', category: 'Medical'),
          ChecklistItem(item: 'Power Bank', category: 'Electronics'),
          ChecklistItem(item: 'Flashlight/Torch', category: 'Electronics'),
        ],
      );
    case EssentialCategory.guidelines:
      return const TravelEssentialDetail(
        title: 'Official Yatra Guidelines',
        description:
            'Follow these government-mandated guidelines to ensure a smooth and legal pilgrimage experience.',
        sections: [
          EssentialSection(
            title: 'Biometric Registration',
            content:
                'Ensure you have your physical copy of the registration slip. It will be scanned at multiple checkpoints.',
            icon: Icons.fingerprint_rounded,
            accentColor: AppColors.secondary,
          ),
          EssentialSection(
            title: 'Reporting Timings',
            content:
                'Arrive at the base camp before 9:00 AM. Trekking after 4:00 PM is strictly prohibited for safety.',
            icon: Icons.timer_rounded,
            accentColor: AppColors.warning,
          ),
        ],
      );
    case EssentialCategory.rules:
      return const TravelEssentialDetail(
        title: 'Do\'s and Don\'ts',
        description:
            'Respect the local culture and the fragile mountain ecosystem by following these simple rules.',
        sections: [
          EssentialSection(
            title: 'DO: Respect Local Traditions',
            content:
                'Dress modestly and take permission before taking photos of locals or religious ceremonies.',
            icon: Icons.check_circle_rounded,
            accentColor: AppColors.success,
          ),
          EssentialSection(
            title: 'DON\'T: Litter the Mountains',
            content:
                'Carry all your plastic waste back to the base camp. Fines up to ₹5000 apply for littering.',
            icon: Icons.cancel_rounded,
            accentColor: AppColors.error,
          ),
        ],
      );
  }
}
