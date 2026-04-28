import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_app_bar.dart';
import '../../../../shared/widgets/yatra_card.dart';
import '../../../../shared/widgets/yatra_section_header.dart';

/// Screen displaying detailed Altitude & Oxygen graphs for safety monitoring.
class SafetyVitalsScreen extends StatelessWidget {
  const SafetyVitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const YatraAppBar(
        title: 'Safety Vitals',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Current Stats Card
            _buildCurrentStatsSummary(),
            const SizedBox(height: 24),

            // Altitude Graph
            const YatraSectionHeader(title: 'Altitude Trend (Last 6h)', padding: EdgeInsets.zero),
            const SizedBox(height: 12),
            _buildGraphCard(
              title: 'Elevation Profile',
              color: AppColors.primary,
              child: CustomPaint(
                size: const Size(double.infinity, 180),
                painter: _VitalsGraphPainter(
                  points: [2800, 2950, 3100, 3050, 3300, 3583],
                  min: 2500,
                  max: 4000,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Oxygen Graph
            const YatraSectionHeader(title: 'Oxygen Saturation (Est.)', padding: EdgeInsets.zero),
            const SizedBox(height: 12),
            _buildGraphCard(
              title: 'SpO2 Trend',
              color: Colors.green,
              child: CustomPaint(
                size: const Size(double.infinity, 180),
                painter: _VitalsGraphPainter(
                  points: [98, 97, 95, 94, 93, 92],
                  min: 80,
                  max: 100,
                  color: Colors.green,
                  showThreshold: true,
                  threshold: 90,
                ),
              ),
            ),

            const SizedBox(height: 24),
            
            // Health Advice
            YatraCard(
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, color: AppColors.primary),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Your oxygen level is stable for the current altitude. Stay hydrated and ascend slowly.',
                      style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
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

  Widget _buildCurrentStatsSummary() {
    return Row(
      children: [
        Expanded(
          child: _buildStatBadge('3,583m', 'Current Altitude', Icons.landscape_rounded, AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatBadge('92%', 'Est. Oxygen', Icons.air_rounded, Colors.green),
        ),
      ],
    );
  }

  Widget _buildStatBadge(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
          Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildGraphCard({required String title, required Color color, required Widget child}) {
    return YatraCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                child: Text('Live', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _VitalsGraphPainter extends CustomPainter {
  final List<double> points;
  final double min;
  final double max;
  final Color color;
  final bool showThreshold;
  final double? threshold;

  _VitalsGraphPainter({
    required this.points,
    required this.min,
    required this.max,
    required this.color,
    this.showThreshold = false,
    this.threshold,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color.withValues(alpha: 0.3), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final fillPath = Path();

    final xGap = size.width / (points.length - 1);
    
    double getY(double val) {
      return size.height - ((val - min) / (max - min) * size.height);
    }

    path.moveTo(0, getY(points[0]));
    fillPath.moveTo(0, size.height);
    fillPath.lineTo(0, getY(points[0]));

    for (int i = 1; i < points.length; i++) {
      final x = i * xGap;
      final y = getY(points[i]);
      path.lineTo(x, y);
      fillPath.lineTo(x, y);
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw Points
    final dotPaint = Paint()..color = color;
    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(Offset(i * xGap, getY(points[i])), 4, dotPaint);
    }

    // Draw Threshold
    if (showThreshold && threshold != null) {
      final tY = getY(threshold!);
      final tPaint = Paint()
        ..color = Colors.red.withValues(alpha: 0.5)
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;
      
      canvas.drawLine(Offset(0, tY), Offset(size.width, tY), tPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
