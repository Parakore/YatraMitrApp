import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_router.dart';
import '../../features/alerts/model/disaster_alert.dart';
import '../../features/crowd/model/crowd_status.dart';

/// A banner for displaying active disaster alerts.
class AlertBanner extends StatelessWidget {
  final DisasterAlert alert;

  const AlertBanner({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final color = _getSeverityColor(alert.severity);
    
    return InkWell(
      onTap: () => context.push(AppRouter.disasterAlerts),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        child: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alert.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    alert.message,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.low:
        return Colors.blue;
      case AlertSeverity.medium:
        return Colors.orange;
      case AlertSeverity.high:
        return Colors.red;
    }
  }
}

/// A widget for displaying crowd intelligence data.
class CrowdIndicator extends StatelessWidget {
  final CrowdStatus status;

  const CrowdIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = _getDensityColor(status.density);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.people_rounded, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              'Crowd: ${status.density.name.toUpperCase()}',
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text('⏳ Wait time: ${status.waitTime}'),
        Text('🕒 Best time: ${status.suggestedTime}'),
      ],
    );
  }

  Color _getDensityColor(CrowdDensity density) {
    switch (density) {
      case CrowdDensity.low:
        return Colors.green;
      case CrowdDensity.moderate:
        return Colors.orange;
      case CrowdDensity.high:
        return Colors.red;
    }
  }
}
