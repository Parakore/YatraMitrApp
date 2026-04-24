import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/disaster_models.dart';

class RouteClosuresList extends StatelessWidget {
  final List<RouteClosure> closures;
  const RouteClosuresList({super.key, required this.closures});

  @override
  Widget build(BuildContext context) {
    if (closures.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('All routes are currently clear.'),
      );
    }

    return Column(
      children: closures.map((closure) => _buildClosureCard(closure)).toList(),
    );
  }

  Widget _buildClosureCard(RouteClosure closure) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  closure.routeName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                _buildStatusChip(closure.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    closure.reason,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
            if (closure.estimatedReopenTime != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.timer_outlined, size: 16, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Est. Reopen: ${closure.estimatedReopenTime}',
                    style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'Open':
        color = AppColors.success;
        break;
      case 'Partial':
        color = AppColors.warning;
        break;
      case 'Closed':
        color = AppColors.error;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(76)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}
