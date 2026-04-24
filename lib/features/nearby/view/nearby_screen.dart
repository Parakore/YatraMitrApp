import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatramitra/features/nearby/model/nearby_place.dart';
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
      {'label': 'Toilets', 'icon': Icons.wc},
      {'label': 'ATM', 'icon': Icons.atm},
      {'label': 'Food', 'icon': Icons.restaurant},
      {'label': 'Medical', 'icon': Icons.medical_services},
      {'label': 'Rest Area', 'icon': Icons.hotel},
      {'label': 'Police', 'icon': Icons.local_police},
      {'label': 'Water', 'icon': Icons.water_drop},
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
                width: 75,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
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
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

  Widget _buildPlaceCard(NearbyPlace place) {
    return AppCard(
      padding: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_getCategoryIcon(place.category),
                      color: AppColors.primary, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 2),
                      Text(place.address,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(place.distanceInfo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary)),
                    if (place.rating > 0)
                      Row(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  index < place.rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 14,
                                  color: Colors.amber,
                                )),
                      ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline,
                          size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          place.subInfo,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: place.isSafe
                        ? Colors.green.shade50
                        : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    place.statusTag,
                    style: TextStyle(
                      color: place.isSafe
                          ? Colors.green.shade700
                          : Colors.blue.shade700,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'medical':
        return Icons.medical_services;
      case 'toilets':
        return Icons.wc;
      case 'atm':
        return Icons.atm;
      case 'rest area':
        return Icons.hotel;
      case 'police':
        return Icons.local_police;
      case 'food':
        return Icons.restaurant;
      case 'water':
        return Icons.water_drop;
      default:
        return Icons.location_on;
    }
  }
}
