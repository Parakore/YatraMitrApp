import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/disaster_models.dart';

class WeatherSummaryCard extends StatelessWidget {
  final DisasterIntelligenceSummary summary;
  const WeatherSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.secondary, AppColors.blueDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withAlpha(76),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
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
                    '${summary.weatherSummary.temperature}°C',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    summary.weatherSummary.condition,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
              const Icon(Icons.cloudy_snowing, size: 60, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Rainfall', '${summary.weatherSummary.rainfall}mm', Icons.water_drop),
              _buildStatItem('Visibility', summary.weatherSummary.visibility, Icons.visibility),
              _buildStatItem('Alerts', summary.activeAlerts.length.toString(), Icons.notification_important),
            ],
          ),
          const SizedBox(height: 20),
          _buildRouteOverview(),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildRouteOverview() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.map, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text(
                'Char Dham Route Status',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: summary.routeStatuses.map((rs) => _buildRoutePill(rs)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutePill(RouteStatus rs) {
    Color statusColor;
    switch (rs.status) {
      case 'OPEN':
        statusColor = AppColors.success;
        break;
      case 'CAUTION':
        statusColor = AppColors.warning;
        break;
      case 'CLOSED':
        statusColor = AppColors.error;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Column(
      children: [
        Text(
          rs.name,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            rs.status,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
