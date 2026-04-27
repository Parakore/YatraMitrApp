import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../viewmodel/nearby_viewmodel.dart';
import 'widgets/nearby_header.dart';
import 'widgets/category_selector.dart';
import 'widgets/facility_card.dart';

/// Redesigned Facilities Locator Screen aligned with Global Design Standards.
/// Provides a premium, high-contrast UI for finding nearby services.
class NearbyScreen extends ConsumerStatefulWidget {
  const NearbyScreen({super.key});

  @override
  ConsumerState<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends ConsumerState<NearbyScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nearbyState = ref.watch(nearbyViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Facilities Locator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0D1B2A),
                Color(0xFF1A3A6B),
              ],
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              AppColors.primary.withAlpha(10),
            ],
          ),
        ),
        child: Column(
          children: [
            // Premium Header with Search and Crowd Intel
            NearbyHeader(
              crowdStatus: 'Moderately Crowded',
              crowdDetail: 'Wait times: 5–10 mins at ATMs, 2 mins at Toilets',
              onSearchChanged: (value) {
                setState(() => _searchQuery = value.toLowerCase());
              },
            ),
            
            _buildSectionHeader('Service Categories'),
            
            // Modern Category Chips
            CategorySelector(
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                setState(() => _selectedCategory = category);
                ref.read(nearbyViewModelProvider.notifier).filterByCategory(category);
              },
            ),
            
            const SizedBox(height: 12),
            
            // Dynamic Facility List
            Expanded(
              child: nearbyState.when(
                data: (places) {
                  // Apply Search Filter locally for instant UX
                  final filteredPlaces = places.where((p) {
                    final matchesSearch = p.name.toLowerCase().contains(_searchQuery) ||
                        p.category.toLowerCase().contains(_searchQuery) ||
                        p.address.toLowerCase().contains(_searchQuery);
                    return matchesSearch;
                  }).toList();

                  if (filteredPlaces.isEmpty) {
                    return _buildEmptyState();
                  }

                  return RefreshIndicator(
                    onRefresh: () => ref.read(nearbyViewModelProvider.notifier).refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: filteredPlaces.length,
                      itemBuilder: (context, index) {
                        final place = filteredPlaces[index];
                        return RepaintBoundary(
                          key: ValueKey('facility_${place.id}'),
                          child: FacilityCard(place: place),
                        );
                      },
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (err, stack) => _buildErrorState(err.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B263B),
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No facilities found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching for something else',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text('Something went wrong'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () => ref.refresh(nearbyViewModelProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
