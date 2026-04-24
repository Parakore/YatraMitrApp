import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../viewmodel/nearby_viewmodel.dart';

/// Screen displaying nearby services and places.
/// Designed with high contrast for pilgrims and elderly users.
class NearbyScreen extends ConsumerWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyState = ref.watch(nearbyViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Services'),
      ),
      body: nearbyState.when(
        data: (places) => RefreshIndicator(
          onRefresh: () => ref.read(nearbyViewModelProvider.notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              return AppCard(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary.withAlpha(25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getCategoryIcon(place.category),
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: theme.textTheme.labelLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${place.distance} km away • ${place.category}',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    if (place.isSafe)
                      const Icon(Icons.verified_user, color: Colors.green),
                  ],
                ),
                onTap: () {
                  // Show details
                },
              );
            },
          ),
        ),
        loading: () =>
            const LoadingWidget(message: 'Finding nearby services...'),
        error: (error, stack) => AppErrorWidget(
          errorMessage: error.toString(),
          onRetry: () => ref.read(nearbyViewModelProvider.notifier).refresh(),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'medical':
        return Icons.medical_services_rounded;
      case 'rest':
        return Icons.hotel_rounded;
      case 'water':
        return Icons.water_drop_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }
}
