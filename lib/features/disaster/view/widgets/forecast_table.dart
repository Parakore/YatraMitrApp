import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/disaster_models.dart';

class ForecastTable extends StatelessWidget {
  final List<ForecastModel> forecasts;
  const ForecastTable({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: forecasts.map((f) => _buildForecastItem(context, f)).toList(),
      ),
    );
  }

  Widget _buildForecastItem(BuildContext context, ForecastModel f) {
    Color statusColor;
    IconData statusIcon;
    switch (f.trekStatus) {
      case 'Proceed':
        statusColor = AppColors.success;
        statusIcon = Icons.check_circle_rounded;
        break;
      case 'Caution':
        statusColor = AppColors.warning;
        statusIcon = Icons.warning_rounded;
        break;
      case 'Avoid':
        statusColor = AppColors.error;
        statusIcon = Icons.cancel_rounded;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help_outline_rounded;
    }

    final dayName = _getDayName(f.date);
    final dateStr = '${f.date.day} ${_getMonthName(f.date)}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withAlpha(20), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Date Column
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dayName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  dateStr,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(width: 1, height: 40, color: AppColors.primary.withAlpha(20)),
          const SizedBox(width: 16),
          // Condition & Temp
          Expanded(
            child: Row(
              children: [
                _getIconForCondition(f.condition, size: 28),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      f.condition,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${f.temperature.toStringAsFixed(1)}°C | ${f.rainfall}mm rain',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Status Pill
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, color: statusColor, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      f.trekStatus,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              if (f.bestTravelWindow != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    f.bestTravelWindow!,
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _getDayName(DateTime date) {
    final now = DateTime.now();
    if (date.day == now.day) return 'Today';
    if (date.day == now.add(const Duration(days: 1)).day) return 'Tomorrow';
    
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }

  String _getMonthName(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[date.month - 1];
  }

  Widget _getIconForCondition(String condition, {double size = 16}) {
    IconData icon;
    Color color;
    switch (condition.toLowerCase()) {
      case 'rain':
      case 'rainy':
        icon = Icons.umbrella_rounded;
        color = Colors.blue;
        break;
      case 'clouds':
      case 'cloudy':
        icon = Icons.cloud_rounded;
        color = Colors.blueGrey;
        break;
      case 'clear':
      case 'sunny':
        icon = Icons.wb_sunny_rounded;
        color = AppColors.gold;
        break;
      case 'storm':
      case 'stormy':
        icon = Icons.thunderstorm_rounded;
        color = Colors.deepPurple;
        break;
      default:
        icon = Icons.cloud_queue_rounded;
        color = Colors.blueGrey;
    }
    return Icon(icon, color: color, size: size);
  }
}
