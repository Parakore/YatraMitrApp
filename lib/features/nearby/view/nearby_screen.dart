import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/features/crowd/model/crowd_status.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/shimmer_widget.dart';
import '../../../shared/widgets/smart_widgets.dart';
import '../../crowd/viewmodel/crowd_viewmodel.dart';
import '../viewmodel/nearby_viewmodel.dart';

class NearbyScreen extends ConsumerWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyState = ref.watch(nearbyViewModelProvider);
    final crowdState = ref.watch(crowdViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Facilities Locator'),
      ),
      body: Column(
        children: [
          _buildCrowdSummary(crowdState),
          _buildCategoryFilter(ref),
          Expanded(
            child: nearbyState.when(
              data: (places) => RefreshIndicator(
                onRefresh: () async {
                  await ref.read(nearbyViewModelProvider.notifier).refresh();
                  await ref.read(crowdViewModelProvider.notifier).refresh();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: places.length,
                  itemBuilder: (context, index) =>
                      _buildPlaceCard(places[index]),
                ),
              ),
              loading: () => ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => const ShimmerListTile(),
              ),
              error: (error, _) => AppErrorWidget(
                errorMessage: error.toString(),
                onRetry: () =>
                    ref.read(nearbyViewModelProvider.notifier).refresh(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCrowdSummary(AsyncValue<List<CrowdStatus>> crowdState) {
    return crowdState.when(
      data: (statusList) {
        // Find Kedarnath Temple status specifically
        final kedarStatus = statusList.firstWhere(
          (s) => s.locationId == 'kedarnath_temple',
          orElse: () => statusList.first,
        );
        return Padding(
          padding: const EdgeInsets.all(16),
          child: AppCard(
            color: AppColors.secondary.withAlpha(10),
            child: CrowdIndicator(status: kedarStatus),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildCategoryFilter(WidgetRef ref) {
    final categories = [
      {'label': 'All', 'icon': Icons.grid_view},
      {'label': 'Medical', 'icon': Icons.medical_services},
      {'label': 'Oxygen', 'icon': Icons.air},
      {'label': 'Rest', 'icon': Icons.hotel},
      {'label': 'Police', 'icon': Icons.local_police},
      {'label': 'Food', 'icon': Icons.restaurant},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => ref
                  .read(nearbyViewModelProvider.notifier)
                  .filterByCategory(cat['label'] as String),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 70,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cat['icon'] as IconData,
                        size: 24, color: AppColors.primary),
                    const SizedBox(height: 4),
                    Text(
                      cat['label'] as String,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceCard(dynamic place) {
    return AppCard(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondary.withAlpha(20),
          child: Icon(_getCategoryIcon(place.category),
              color: AppColors.secondary),
        ),
        title: Text(place.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${place.distance} km away • ${place.category}'),
        trailing: place.isSafe
            ? const Icon(Icons.verified_user, color: Colors.green, size: 18)
            : const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'medical':
        return Icons.medical_services;
      case 'oxygen':
        return Icons.air;
      case 'rest':
        return Icons.hotel;
      case 'police':
        return Icons.local_police;
      case 'food':
        return Icons.restaurant;
      default:
        return Icons.location_on;
    }
  }
}
