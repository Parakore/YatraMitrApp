import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

/// Premium Navigation & Maps screen designed for offline use and elderly pilgrims.
class NavigationMapsScreen extends StatelessWidget {
  const NavigationMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Navigation & Maps',
          style: TextStyle(
              color: AppColors.textPrimary, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_for_offline_outlined,
                color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Offline Badge
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            color: AppColors.success.withValues(alpha: 0.1),
            child: Row(
              children: [
                const Icon(Icons.check_circle,
                    color: AppColors.success, size: 16),
                const SizedBox(width: 8),
                const Text(
                  'OFFLINE MODE ENABLED',
                  style: TextStyle(
                    color: AppColors.success,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for temples, stays...',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon:
                      const Icon(Icons.search, color: AppColors.primary),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          // Map Placeholder
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.shade200,
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/dhams/kedarnath.png'), // Using existing image as placeholder
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on,
                            color: AppColors.primary, size: 48),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Kedarnath Temple',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppColors.primary,
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Quick Directions
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommended Routes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildRouteItem(
                  'Gaurikund to Kedarnath',
                  '16 km • 6-8 hours',
                  Icons.directions_walk,
                ),
                const SizedBox(height: 12),
                _buildRouteItem(
                  'Sonprayag to Gaurikund',
                  '5 km • 30 mins',
                  Icons.directions_bus,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteItem(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(
                        color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
