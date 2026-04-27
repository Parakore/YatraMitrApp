import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/home_models.dart';
import 'home_viewmodel.dart';

part 'dham_listing_viewmodel.g.dart';

enum DhamFilter { all, goodWeather, lowCrowd, open }

class DhamListingState {
  final List<DhamInfo> allDhams;
  final List<DhamInfo> filteredDhams;
  final DhamFilter activeFilter;
  final String yatraUpdate;

  DhamListingState({
    required this.allDhams,
    required this.filteredDhams,
    this.activeFilter = DhamFilter.all,
    this.yatraUpdate =
        'Yatra Update: All 4 Dhams are open for Darshan. Stay Updated for weather and Route conditions.',
  });

  DhamListingState copyWith({
    List<DhamInfo>? allDhams,
    List<DhamInfo>? filteredDhams,
    DhamFilter? activeFilter,
    String? yatraUpdate,
  }) {
    return DhamListingState(
      allDhams: allDhams ?? this.allDhams,
      filteredDhams: filteredDhams ?? this.filteredDhams,
      activeFilter: activeFilter ?? this.activeFilter,
      yatraUpdate: yatraUpdate ?? this.yatraUpdate,
    );
  }
}

@riverpod
class DhamListingViewModel extends _$DhamListingViewModel {
  @override
  FutureOr<DhamListingState> build() async {
    // We can watch the homeViewModel to get the dhams if they are already loaded
    final homeState = await ref.watch(homeViewModelProvider.future);

    return DhamListingState(
      allDhams: homeState.dhams,
      filteredDhams: homeState.dhams,
    );
  }

  void setFilter(DhamFilter filter) {
    state.whenData((data) {
      List<DhamInfo> filtered = data.allDhams;

      switch (filter) {
        case DhamFilter.goodWeather:
          filtered = data.allDhams.where((d) => d.temperature > 8).toList();
          break;
        case DhamFilter.lowCrowd:
          filtered =
              data.allDhams.where((d) => d.crowdStatus == 'Low').toList();
          break;
        case DhamFilter.open:
          filtered = data.allDhams.where((d) => d.isOpen).toList();
          break;
        case DhamFilter.all:
          filtered = data.allDhams;
      }

      state = AsyncData(data.copyWith(
        activeFilter: filter,
        filteredDhams: filtered,
      ));
    });
  }
}
