import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../shared/widgets/error_widget.dart';
import '../viewmodel/disaster_viewmodel.dart';
import '../model/disaster_models.dart';
import 'widgets/weather_summary_card.dart';
import 'widgets/ai_recommendation_block.dart';
import 'widgets/forecast_table.dart';
import 'widgets/risk_zones_grid.dart';
import 'widgets/route_closures_list.dart';

class DisasterScreen extends ConsumerWidget {
  const DisasterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryState = ref.watch(disasterIntelligenceViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Disaster Intelligence',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0D1B2A), Color(0xFF1A3A6B)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 4, color: AppColors.saffron),
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(disasterIntelligenceViewModelProvider.notifier).refresh(),
        color: AppColors.saffron,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withAlpha(40),
                AppColors.primary.withAlpha(10),
              ],
            ),
          ),
          child: summaryState.when(
            data: (summary) => _buildContent(context, ref, summary),
            loading: () =>
                const LoadingWidget(message: 'Analyzing safety data...'),
            error: (error, stack) => AppErrorWidget(
              errorMessage: error.toString(),
              onRetry: () => ref
                  .read(disasterIntelligenceViewModelProvider.notifier)
                  .refresh(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.saffron,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref,
      DisasterIntelligenceSummary summary) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Weather Summary & Route Overview
          WeatherSummaryCard(summary: summary),

          _buildSectionHeader('AI Safety Recommendation'),

          // 2. AI Recommendation Block
          AiRecommendationBlock(recommendations: summary.aiRecommendations),

          _buildSectionHeader('Active Safety Alerts'),

          // 3. Active Alerts
          _buildAlertsList(summary.activeAlerts),

          _buildSectionHeader('5-Day Safety Forecast'),

          // 4. Forecast Table
          ForecastTable(forecasts: summary.fiveDayForecast),

          _buildSectionHeader('Landslide Risk Zones'),

          // 5. Landslide Risk Zones
          RiskZonesGrid(zones: summary.landslideZones),

          _buildSectionHeader('Route Status & Closures'),

          // 6. Route Closures
          RouteClosuresList(closures: summary.routeClosures),

          const SizedBox(height: 32),

          // Last Updated Info
          Center(
            child: Column(
              children: [
                const Icon(Icons.update,
                    size: 16, color: AppColors.textSecondary),
                const SizedBox(height: 4),
                Text(
                  'Last Updated: ${summary.lastUpdated.hour}:${summary.lastUpdated.minute.toString().padLeft(2, '0')} ${summary.lastUpdated.hour >= 12 ? 'PM' : 'AM'}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Safety data refreshed automatically',
                  style: TextStyle(
                    color: AppColors.textSecondary.withAlpha(150),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildAlertsList(List<AlertModel> alerts) {
    if (alerts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No active safety alerts.'),
      );
    }

    return Column(
      children: alerts.map((alert) => _AlertCard(alert: alert)).toList(),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final AlertModel alert;
  const _AlertCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    final color =
        alert.severity == 'High' ? AppColors.error : AppColors.warning;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shadowColor: color.withAlpha(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withAlpha(40), width: 1.5),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.warning_amber_rounded, color: color, size: 24),
          ),
          title: Text(
            '${alert.type} Alert',
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
          subtitle: Text(
            alert.location,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  alert.severity.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${DateTime.now().difference(alert.timestamp).inMinutes}m ago',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 10),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'RECOMMENDED ACTION',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alert.action,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
