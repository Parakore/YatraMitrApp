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
        title: const Text(
          'Disaster Intelligence',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
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
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: AppColors.primary.withAlpha(30),
        child: summaryState.when(
          data: (summary) => _buildContent(context, ref, summary),
          loading: () =>
              const LoadingWidget(message: 'Analyzing safety data...'),
          error: (error, stack) => AppErrorWidget(
            errorMessage: error.toString(),
            onRetry: () => ref.refresh(disasterIntelligenceViewModelProvider),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref,
      DisasterIntelligenceSummary summary) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Weather Summary & Route Overview
          WeatherSummaryCard(summary: summary),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'AI Safety Recommendation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // 2. AI Recommendation Block
          AiRecommendationBlock(recommendations: summary.aiRecommendations),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Active Safety Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // 3. Active Alerts
          _buildAlertsList(summary.activeAlerts),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              '5-Day Safety Forecast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // 4. Forecast Table
          ForecastTable(forecasts: summary.fiveDayForecast),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Landslide Risk Zones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // 5. Landslide Risk Zones
          RiskZonesGrid(zones: summary.landslideZones),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'Route Status & Closures',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // 6. Route Closures
          RouteClosuresList(closures: summary.routeClosures),

          const SizedBox(height: 32),

          // Last Updated Info
          Center(
            child: Text(
              'Last Updated: ${summary.lastUpdated.toString().split('.')[0]}',
              style:
                  const TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withAlpha(76), width: 1),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.warning_amber_rounded, color: color),
        ),
        title: Text(
          '${alert.type} Alert — ${alert.location}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(alert.action,
                style: const TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Severity: ${alert.severity}',
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  '${DateTime.now().difference(alert.timestamp).inMinutes}m ago',
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
