import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../model/home_models.dart';

part 'home_viewmodel.g.dart';

/// State class for the Home Screen.
class HomeState {
  final String currentLocation;
  final List<DhamInfo> dhams;
  final List<QuickAction> quickActions;
  final List<TravelEssential> travelEssentials;
  final WeatherAlert? weatherAlert;
  final int currentBannerIndex;

  HomeState({
    required this.currentLocation,
    required this.dhams,
    required this.quickActions,
    required this.travelEssentials,
    this.weatherAlert,
    this.currentBannerIndex = 0,
  });

  HomeState copyWith({
    String? currentLocation,
    List<DhamInfo>? dhams,
    List<QuickAction>? quickActions,
    List<TravelEssential>? travelEssentials,
    WeatherAlert? weatherAlert,
    int? currentBannerIndex,
  }) {
    return HomeState(
      currentLocation: currentLocation ?? this.currentLocation,
      dhams: dhams ?? this.dhams,
      quickActions: quickActions ?? this.quickActions,
      travelEssentials: travelEssentials ?? this.travelEssentials,
      weatherAlert: weatherAlert ?? this.weatherAlert,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
    );
  }
}

/// ViewModel for the Home Screen.
@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<HomeState> build() async {
    // Simulated initial data fetch
    // In a real app, this would come from a repository
    return HomeState(
      currentLocation: 'Dehradun, Uttarakhand',
      currentBannerIndex: 0,
      dhams: const [
        DhamInfo(
          name: 'Yamunotri Dham',
          location: 'Uttarkashi',
          description: 'First stop of the Yatra, dedicated to Goddess Yamuna.',
          imageUrl: 'assets/images/dhams/yamunotri.png',
          temperature: 8.5,
          crowdStatus: 'Medium',
          altitude: '3,293 m',
          isOpen: true,
        ),
        DhamInfo(
          name: 'Gangotri Dham',
          location: 'Uttarkashi',
          description: 'The spiritual origin of the holy River Ganga.',
          imageUrl: 'assets/images/dhams/gangotri.png',
          temperature: 10.0,
          crowdStatus: 'Low',
          altitude: '3,100 m',
          isOpen: true,
        ),
        DhamInfo(
          name: 'Kedarnath Dham',
          location: 'Rudraprayag',
          description:
              'The sacred dham of Lord Shiva, nestled at 3,583 meters.',
          imageUrl: 'assets/images/dhams/kedarnath.png',
          temperature: 5.0,
          crowdStatus: 'High',
          altitude: '3,583 m',
          alertMessage: 'Rain Alert: Light rain expected',
          isOpen: true,
        ),
        DhamInfo(
          name: 'Badrinath Dham',
          location: 'Chamoli',
          description:
              'Dedicated to Lord Vishnu, the preserver of the universe.',
          imageUrl: 'assets/images/dhams/badrinath.png',
          temperature: 12.0,
          crowdStatus: 'Medium',
          altitude: '3,133 m',
          isOpen: true,
        ),
      ],
      quickActions: [
        QuickAction(
          title: 'Register/\nStatus',
          iconPath: 'assets/images/icons/register_status.png',
          route: '/coming-soon',
          color: AppColors.primary,
          isFuture: true,
        ),
        QuickAction(
          title: 'Helicopter\nBooking',
          iconPath: 'assets/images/icons/helicopter_booking.png',
          route: '/coming-soon',
          color: AppColors.teal,
          isFuture: true,
        ),
        QuickAction(
          title: 'Navigation\n& Maps',
          iconPath: 'assets/images/icons/route_map.png',
          route: AppRouter.offlineMaps,
          color: AppColors.secondary,
        ),
        QuickAction(
          title: 'Emergency\nSOS',
          iconPath: 'assets/images/icons/emergency_sos.png',
          route: AppRouter.emergency,
          color: AppColors.error,
        ),
        QuickAction(
          title: 'Disaster\nAlerts',
          iconPath: 'assets/images/icons/difficulty.png', // Placeholder
          route: AppRouter.disasterAlerts,
          color: AppColors.warning,
        ),
        QuickAction(
          title: 'Crowd\nIntel',
          iconPath: 'assets/images/icons/duration.png', // Placeholder
          route: '/coming-soon',
          color: AppColors.purple,
          isFuture: true,
        ),
        QuickAction(
          title: 'Facility\nLocator',
          iconPath: 'assets/images/icons/find_stay.png', // Placeholder
          route: AppRouter.nearby,
          color: AppColors.success,
        ),
        QuickAction(
          title: 'Grievance\nRedressal',
          iconPath: 'assets/images/icons/dos_donts.png', // Placeholder
          route: '/grievance',
          color: AppColors.blueDark,
        ),
        QuickAction(
          title: 'AI Yatra\nPlanner',
          iconPath: 'assets/images/icons/yatra_guidelines.png', // Placeholder
          route: '/coming-soon',
          color: AppColors.gold,
          isFuture: true,
        ),
      ],
      travelEssentials: const [
        TravelEssential(
          title: 'Health Tips',
          iconPath: 'assets/images/icons/health_tips.png',
          route: AppRouter.yatraGuide,
        ),
        TravelEssential(
          title: 'Yatra\nGuidelines',
          iconPath: 'assets/images/icons/yatra_guidelines.png',
          route: AppRouter.yatraGuide,
        ),
        TravelEssential(
          title: 'Do\'s and\nDon\'ts',
          iconPath: 'assets/images/icons/dos_donts.png',
          route: AppRouter.yatraGuide,
        ),
        TravelEssential(
          title: 'Packaging\nChecklist',
          iconPath: 'assets/images/icons/packaging_checklist.png',
          route: AppRouter.yatraGuide,
        ),
      ],
      weatherAlert: const WeatherAlert(
        title: 'Weather Alert',
        message:
            'Heavy Rain expected in Kedarnath region. Carry rain gear and follow safety Guidelines',
        isCritical: true,
      ),
    );
  }

  void updateBannerIndex(int index) {
    state.whenData((data) {
      state = AsyncData(data.copyWith(currentBannerIndex: index));
    });
  }
}
