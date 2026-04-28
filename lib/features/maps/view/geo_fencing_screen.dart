import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/yatra_app_bar.dart';
import '../../../../shared/widgets/yatra_card.dart';
import '../../../../shared/widgets/yatra_section_header.dart';

/// Screen displaying detailed Geo-fencing zone information and safety protocols.
class GeoFencingScreen extends StatelessWidget {
  const GeoFencingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const YatraAppBar(
        title: 'Geo-fencing Zones',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Zone Header
            _buildCurrentZoneHeader(),
            const SizedBox(height: 24),

            const YatraSectionHeader(title: 'Zone Definitions', padding: EdgeInsets.zero),
            const SizedBox(height: 12),
            _buildZoneInfoCard(
              'Safe Zones (Green)',
              'Areas with continuous monitoring and medical facilities available within 15 minutes of response time.',
              Colors.green,
              Icons.check_circle_rounded,
            ),
            _buildZoneInfoCard(
              'Caution Zones (Orange)',
              'Challenging terrain with limited visibility or steep inclines. Stay on marked paths.',
              Colors.orange,
              Icons.warning_rounded,
            ),
            _buildZoneInfoCard(
              'Restricted Zones (Red)',
              'No-entry areas due to landslide risk, high-altitude exposure, or environmental protection.',
              Colors.red,
              Icons.block_rounded,
            ),

            const SizedBox(height: 24),
            const YatraSectionHeader(title: 'Safety Protocol', padding: EdgeInsets.zero),
            const SizedBox(height: 12),
            YatraCard(
              child: Column(
                children: [
                  _buildProtocolStep('1', 'Stay within green markers for optimal safety tracking.'),
                  const Divider(height: 24),
                  _buildProtocolStep('2', 'If you enter a Caution zone, notify your group.'),
                  const Divider(height: 24),
                  _buildProtocolStep('3', 'Emergency SOS will auto-trigger if you stay in a Restricted zone for >5 mins.'),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentZoneHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade700, Colors.green.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.green.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 8)),
        ],
      ),
      child: const Column(
        children: [
          Icon(Icons.verified_user_rounded, color: Colors.white, size: 48),
          SizedBox(height: 16),
          Text(
            'YOU ARE IN A SAFE ZONE',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1),
          ),
          SizedBox(height: 4),
          Text(
            'Medical support is 1.2km away at Base Camp 2.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildZoneInfoCard(String title, String desc, Color color, IconData icon) {
    return YatraCard(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: color)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProtocolStep(String number, String text) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(number, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
