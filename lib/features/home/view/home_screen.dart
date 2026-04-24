import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/status_pill.dart';
import '../../weather/viewmodel/weather_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = Responsive(context);

    final weatherState = ref.watch(weatherViewModelProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        decoration: BoxDecoration(color: AppColors.primary.withAlpha(30)),
        child: Column(
          children: [
            _buildHeroBanner(context, responsive, weatherState),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.saffron,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _buildQuickActionsGrid(context, responsive),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRouter.aiAssistant),
        label: const Text(
          'Ask AI',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.auto_awesome_rounded),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context, Responsive responsive, AsyncValue weatherState) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D1B2A),
            Color(0xFF1A3A6B),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(77),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Namaste,',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'YatraMitra Traveler',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications_none_rounded,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const StatusPill(
                label: 'Safe Zone',
                icon: Icons.shield_outlined,
                type: StatusType.safe,
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.wb_sunny_rounded,
                        color: Colors.orangeAccent, size: 14),
                    const SizedBox(width: 4),
                    weatherState.when(
                      data: (data) => Text(
                        '${data.current.temperature.toStringAsFixed(1)}°C ${data.current.location}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      loading: () => const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      ),
                      error: (_, __) => const Text(
                        '--°C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Your trek to Kedarnath is currently on schedule. Stay safe!',
            style: TextStyle(
              color: Colors.white.withAlpha(180),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context, Responsive responsive) {
    final actions = [
      (
        title: 'Emergency',
        icon: Icons.sos_rounded,
        color: AppColors.error,
        route: AppRouter.emergency
      ),
      (
        title: 'Navigation',
        icon: Icons.map_rounded,
        color: AppColors.teal,
        route: AppRouter.offlineMaps
      ),
      (
        title: 'Medical',
        icon: Icons.local_hospital_rounded,
        color: AppColors.success,
        route: AppRouter.nearby
      ),
      (
        title: 'Crowd Status',
        icon: Icons.groups_rounded,
        color: AppColors.gold,
        route: AppRouter.crowdIntelligence
      ),
      (
        title: 'Weather',
        icon: Icons.thunderstorm_rounded,
        color: AppColors.saffron,
        route: AppRouter.weather
      ),
      (
        title: 'E-Pass',
        icon: Icons.badge_rounded,
        color: AppColors.purple,
        route: AppRouter.yatraGuide
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return _buildQuickActionCard(
          context,
          title: action.title,
          icon: action.icon,
          color: action.color,
          route: action.route,
        );
      },
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(30)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push(route),
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withAlpha(25),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
