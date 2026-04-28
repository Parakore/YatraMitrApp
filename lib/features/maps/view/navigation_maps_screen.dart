import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_app_bar.dart';
import '../../../../shared/widgets/yatra_section_header.dart';
import 'widgets/map_widgets.dart';

/// Premium Navigation & Maps screen with separated, high-fidelity safety monitors.
class NavigationMapsScreen extends StatelessWidget {
  const NavigationMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: YatraAppBar(
        title: 'Navigation & Maps',
        actions: [
          IconButton(
            icon: const Icon(Icons.download_done_rounded, color: Colors.white),
            tooltip: 'Offline Maps',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // 1. Map Layer with Geo-fencing Zones
          _buildMapLayer(),

          // 2. Floating Search Bar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MapSearchBar(),
          ),

          // 3. Separated Safety Monitors (Top Left & Top Right)
          const Positioned(
            left: 20,
            top: 80,
            child: GeoZoneMonitor(
              zoneName: 'Safe Zone',
              zoneColor: Colors.green,
            ),
          ),
          
          const Positioned(
            right: 20,
            top: 80,
            child: OfflineMapBadge(),
          ),

          // 4. Altitude & Oxygen Monitor (Mid Left)
          const Positioned(
            left: 20,
            top: 150,
            child: AltitudeOxygenMonitor(
              altitude: 3583.0,
              oxygenPercent: 92,
            ),
          ),

          // 5. Floating Map Controls (Mid Right)
          const Positioned(
            right: 20,
            top: 150,
            child: MapControls(),
          ),

          // 6. Draggable Bottom Panel
          _buildBottomPanel(context),
        ],
      ),
    );
  }

  Widget _buildMapLayer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E7EB),
        image: DecorationImage(
          image: AssetImage('assets/images/dhams/kedarnath.png'), // Placeholder
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Stack(
        children: [
          // Visual Geo-fencing Zones & Route
          Positioned.fill(
            child: CustomPaint(
              painter: _MapSafetyPainter(),
            ),
          ),
          // Markers
          const Positioned(
            top: 350,
            left: 100,
            child: _MapMarker(
                label: 'Gaurikund',
                icon: Icons.location_on_rounded,
                color: Colors.green),
          ),
          const Positioned(
            top: 180,
            left: 220,
            child: _MapMarker(
                label: 'Kedarnath',
                icon: Icons.temple_hindu_rounded,
                color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.15,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const Text(
                      'Kedarnath High-Altitude Navigation',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'Monitoring your vitals and safety zones in real-time.',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 24),
                    const YatraSectionHeader(
                      title: 'Live Vitals History',
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 12),
                    _buildVitalHistoryItem(
                      'Oxygen Level Stable',
                      '92% (Average for 3,500m)',
                      Icons.favorite_rounded,
                      Colors.green,
                    ),
                    const SizedBox(height: 24),
                    const YatraSectionHeader(
                      title: 'Recommended Routes',
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 12),
                    MapRouteCard(
                      title: 'Trek: Gaurikund Route',
                      distance: '16.5 km',
                      time: '7h 20m',
                      transportIcon: Icons.directions_walk_rounded,
                      onTap: () {},
                    ),
                    MapRouteCard(
                      title: 'Helicopter: Phata Airfield',
                      distance: '12 km',
                      time: '15m',
                      transportIcon: Icons.flight,
                      onTap: () {},
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVitalHistoryItem(String title, String desc, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                Text(desc, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _MapMarker({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)]),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(4)),
          child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

/// Paints the route and safety zones on the map
class _MapSafetyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw Safety Zones (Geo-fencing)
    final safePaint = Paint()..color = Colors.green.withValues(alpha: 0.1)..style = PaintingStyle.fill;
    final cautionPaint = Paint()..color = Colors.orange.withValues(alpha: 0.1)..style = PaintingStyle.fill;
    final restrictedPaint = Paint()..color = Colors.red.withValues(alpha: 0.1)..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 120, safePaint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.4), 80, cautionPaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.2), 60, restrictedPaint);

    // 2. Draw Route Path
    final routePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.25, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.4, size.height * 0.5, size.width * 0.55, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.3, size.width * 0.75, size.height * 0.2);

    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
