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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A3A6B),
            const Color(0xFF0D1B2A).withAlpha(230),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D1B2A).withAlpha(100),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.white.withAlpha(20), width: 1.5),
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
                    '${summary.weatherSummary.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: AppColors.saffron.withAlpha(200)),
                      const SizedBox(width: 4),
                      const Text(
                        'Kedarnath Base',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _buildWeatherIcon(summary.weatherSummary.condition),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Rainfall', '${summary.weatherSummary.rainfall}mm', Icons.water_drop),
                _buildStatItem('Visibility', summary.weatherSummary.visibility, Icons.visibility),
                _buildStatItem('Safety', summary.activeAlerts.length > 1 ? 'Alert' : 'Stable', Icons.shield),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildRouteOverview(),
        ],
      ),
    );
  }

  Widget _buildWeatherIcon(String condition) {
    IconData icon;
    Color color = Colors.white;
    
    switch (condition.toLowerCase()) {
      case 'rain':
        icon = Icons.umbrella_rounded;
        break;
      case 'clouds':
        icon = Icons.cloud_rounded;
        break;
      case 'clear':
        icon = Icons.wb_sunny_rounded;
        color = AppColors.gold;
        break;
      default:
        icon = Icons.cloud_queue_rounded;
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 48, color: color),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.saffron, size: 20),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withAlpha(150),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.alt_route_rounded, color: AppColors.saffron, size: 18),
              const SizedBox(width: 8),
              Text(
                'Char Dham Accessibility',
                style: TextStyle(
                  color: Colors.white.withAlpha(230),
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          style: TextStyle(
            color: Colors.white.withAlpha(180),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withAlpha(40),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: statusColor.withAlpha(80)),
          ),
          child: Text(
            rs.status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w900,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
