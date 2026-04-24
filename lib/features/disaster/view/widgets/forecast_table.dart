import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/disaster_models.dart';

class ForecastTable extends StatelessWidget {
  final List<ForecastModel> forecasts;
  const ForecastTable({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 24,
            headingRowHeight: 40,
            columns: const [
              DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Condition', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Temp', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Rain', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: forecasts.map((f) => _buildRow(f)).toList(),
          ),
        ),
      ),
    );
  }

  DataRow _buildRow(ForecastModel f) {
    Color statusColor;
    switch (f.trekStatus) {
      case 'Proceed':
        statusColor = AppColors.success;
        break;
      case 'Caution':
        statusColor = AppColors.warning;
        break;
      case 'Avoid':
        statusColor = AppColors.error;
        break;
      default:
        statusColor = Colors.grey;
    }

    final dateStr = '${f.date.day}/${f.date.month}';

    return DataRow(
      cells: [
        DataCell(Text(dateStr)),
        DataCell(Row(
          children: [
            _getIconForCondition(f.condition),
            const SizedBox(width: 8),
            Text(f.condition),
          ],
        )),
        DataCell(Text('${f.temperature}°C')),
        DataCell(Text('${f.rainfall}mm')),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withAlpha(25),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: statusColor.withAlpha(76)),
            ),
            child: Text(
              f.trekStatus,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getIconForCondition(String condition) {
    IconData icon;
    Color color;
    switch (condition.toLowerCase()) {
      case 'rainy':
        icon = Icons.umbrella;
        color = Colors.blue;
        break;
      case 'cloudy':
        icon = Icons.cloud;
        color = Colors.grey;
        break;
      case 'sunny':
        icon = Icons.wb_sunny;
        color = Colors.orange;
        break;
      case 'stormy':
        icon = Icons.thunderstorm;
        color = Colors.deepPurple;
        break;
      default:
        icon = Icons.cloud_queue;
        color = Colors.blueGrey;
    }
    return Icon(icon, color: color, size: 16);
  }
}
