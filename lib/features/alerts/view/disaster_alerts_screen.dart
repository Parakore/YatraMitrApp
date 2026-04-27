import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/kpi_card.dart';
import '../../../shared/widgets/status_pill.dart';
import '../viewmodel/alert_viewmodel.dart';
import '../model/disaster_alert.dart';

class DisasterAlertsScreen extends ConsumerWidget {
  const DisasterAlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsState = ref.watch(alertViewModelProvider);
    final weatherState = ref.watch(weatherForecastProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'DISASTER ALERTS',
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
        actions: [
          IconButton(
            onPressed: () => ref.read(alertViewModelProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeatherHeader(weatherState),
            const SizedBox(height: 24),
            const Text(
              'Active Emergency Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            alertsState.when(
              data: (alerts) => alerts.isEmpty 
                  ? const Text('No active alerts at this time.')
                  : Column(children: alerts.map((a) => _buildAlertCard(a)).toList()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error loading alerts: $e'),
            ),
            const SizedBox(height: 24),
            _buildRiskZonesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherHeader(AsyncValue<Map<String, dynamic>> state) {
    return state.when(
      data: (weather) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [AppColors.secondary, AppColors.blueDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather['currentTemp'],
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      weather['condition'],
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
                const Icon(Icons.cloud, size: 64, color: Colors.white),
              ],
            ),
            const Divider(color: Colors.white24, height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeatherStat('Humidity', weather['humidity'], Icons.water_drop),
                _buildWeatherStat('Wind', weather['windSpeed'], Icons.air),
                _buildWeatherStat('Risk', weather['riskLevel'], Icons.warning_amber),
              ],
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
      error: (e, _) => Text('Weather Error: $e'),
    );
  }

  Widget _buildWeatherStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }

  Widget _buildAlertCard(DisasterAlert alert) {
    final color = alert.severity == AlertSeverity.high ? AppColors.error : AppColors.warning;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withAlpha(51), width: 1),
      ),
      child: ListTile(
        leading: Icon(Icons.warning, color: color),
        title: Text(alert.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(alert.message),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 12, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text(alert.location, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ],
        ),
        trailing: StatusPill(
          label: alert.severity.name.toUpperCase(),
          type: alert.severity == AlertSeverity.high ? StatusType.danger : StatusType.warning,
        ),
      ),
    );
  }

  Widget _buildRiskZonesGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Risk Mapping (Simulated)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: const [
            KpiCard(
              label: 'Landslide Risk',
              value: 'Moderate',
              trendLabel: 'Sector 4-B',
              borderColor: AppColors.saffron,
            ),
            KpiCard(
              label: 'Oxygen Level',
              value: '72%',
              trendLabel: 'High Altitude',
              borderColor: AppColors.teal,
            ),
            KpiCard(
              label: 'Path Safety',
              value: 'Caution',
              trendLabel: 'Slippery',
              borderColor: AppColors.gold,
            ),
            KpiCard(
              label: 'Rescue Units',
              value: 'Active',
              trendLabel: '4 Nearby',
              borderColor: AppColors.purple,
            ),
          ],
        ),
      ],
    );
  }
}
