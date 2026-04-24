import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/smart_widgets.dart';
import '../../alerts/viewmodel/alert_viewmodel.dart';
import '../../alerts/model/disaster_alert.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = Responsive(context);
    final alertsState = ref.watch(alertViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('YatraMitra'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Active Alerts Section
            alertsState.when(
              data: (alerts) => Column(
                children: alerts.where((a) => a.severity == AlertSeverity.high).map((a) => AlertBanner(alert: a)).toList(),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: responsive.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(theme, responsive),
                    const SizedBox(height: 32),
                    
                    _buildAssistantCard(context, theme),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Smart Intelligence',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _buildIntelligenceGrid(context, responsive),
                    
                    const SizedBox(height: 24),
                    const Text(
                      'Facilities & Safety',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _buildSafetyActions(context, responsive),
                    
                    const SizedBox(height: 48),
                    _buildEmergencyButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, Responsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Namaste, Pilgrim',
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: responsive.isTablet ? 40 : 32,
            color: AppColors.blueDark,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Your AI-driven companion for a safe Yatra.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildAssistantCard(BuildContext context, ThemeData theme) {
    return AppCard(
      color: AppColors.primary.withAlpha(20),
      onTap: () => context.push(AppRouter.aiAssistant),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Yatra Assistant',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('Ask about rituals, weather, or safety tips.'),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildIntelligenceGrid(BuildContext context, Responsive responsive) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: [
        _buildMenuCard(
          context,
          'Crowd Tracking',
          'Live density & wait times',
          Icons.people_alt_rounded,
          AppColors.gold,
          AppRouter.crowdIntelligence,
        ),
        _buildMenuCard(
          context,
          'Disaster Alerts',
          'Weather & risk zones',
          Icons.thunderstorm_rounded,
          AppColors.error,
          AppRouter.disasterAlerts,
        ),
      ],
    );
  }

  Widget _buildSafetyActions(BuildContext context, Responsive responsive) {
    return Column(
      children: [
        _buildWideActionCard(
          context,
          'Facilities Locator',
          'Find clinics, oxygen & rest areas',
          Icons.local_hospital_rounded,
          AppColors.secondary,
          AppRouter.nearby,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildWideActionCard(
                context,
                'Offline Maps',
                'Download routes',
                Icons.map_rounded,
                AppColors.teal,
                AppRouter.offlineMaps,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildWideActionCard(
                context,
                'Yatra Guide',
                'Digital Yatra slip',
                Icons.book_rounded,
                AppColors.purple,
                AppRouter.yatraGuide,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, String sub, IconData icon, Color color, String route) {
    return AppCard(
      onTap: () => context.push(route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildWideActionCard(BuildContext context, String title, String sub, IconData icon, Color color, String route) {
    return AppCard(
      onTap: () => context.push(route),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(sub, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildEmergencyButton(BuildContext context) {
    return AppButton(
      text: 'EMERGENCY SOS',
      icon: Icons.warning_amber_rounded,
      onPressed: () => context.push(AppRouter.emergency),
      isDanger: true,
    );
  }
}
