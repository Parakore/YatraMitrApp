import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../model/home_models.dart';
import '../viewmodel/dham_listing_viewmodel.dart';

class DhamListingScreen extends ConsumerWidget {
  const DhamListingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(dhamListingViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'The Four Dhams',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: stateAsync.when(
        data: (state) => Column(
          children: [
            _buildFilters(ref, state.activeFilter),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildUpdateBanner(context, state.yatraUpdate),
                  const SizedBox(height: 24),
                  ...state.filteredDhams
                      .map((dham) => _buildDhamCard(context, dham)),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildFilters(WidgetRef ref, DhamFilter activeFilter) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          _FilterChip(
            label: 'All Dhams',
            isActive: activeFilter == DhamFilter.all,
            onTap: () => ref
                .read(dhamListingViewModelProvider.notifier)
                .setFilter(DhamFilter.all),
          ),
          _FilterChip(
            label: 'Good Weather',
            isActive: activeFilter == DhamFilter.goodWeather,
            onTap: () => ref
                .read(dhamListingViewModelProvider.notifier)
                .setFilter(DhamFilter.goodWeather),
          ),
          _FilterChip(
            label: 'Low Crowd',
            isActive: activeFilter == DhamFilter.lowCrowd,
            onTap: () => ref
                .read(dhamListingViewModelProvider.notifier)
                .setFilter(DhamFilter.lowCrowd),
          ),
          _FilterChip(
            label: 'Open',
            isActive: activeFilter == DhamFilter.open,
            onTap: () => ref
                .read(dhamListingViewModelProvider.notifier)
                .setFilter(DhamFilter.open),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateBanner(BuildContext context, String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // Light green for success/update
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_active_rounded, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Color(0xFF2E7D32),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDhamCard(BuildContext context, DhamInfo dham) {
    return GestureDetector(
        onTap: () {
          context.push(
            AppRouter.dhamDetail.replaceFirst(':id', dham.name.toLowerCase()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.asset(
                      dham.imageUrl,
                      width: 110,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dham.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              if (dham.alertMessage != null)
                                const Icon(Icons.warning_amber_rounded,
                                    color: Colors.red, size: 20),
                            ],
                          ),
                          Text(
                            '${dham.location}, Uttarakhand',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildKPI(Icons.wb_sunny_outlined,
                                  '${dham.temperature.toInt()}°C'),
                              _buildKPI(Icons.people_outline_rounded,
                                  dham.crowdStatus),
                              _buildKPI(Icons.terrain_outlined, dham.altitude),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (dham.alertMessage != null)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    dham.alertMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ));
  }

  Widget _buildKPI(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.primary),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color:
              isActive ? AppColors.primary : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
