// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nearbyViewModelHash() => r'2b091fd8815afb35d140fbbbbb599060e58130c7';

/// ViewModel for handling Nearby Services logic.
/// Responsible for fetching and providing nearby data state.
///
/// Copied from [NearbyViewModel].
@ProviderFor(NearbyViewModel)
final nearbyViewModelProvider = AutoDisposeAsyncNotifierProvider<
    NearbyViewModel, List<NearbyPlace>>.internal(
  NearbyViewModel.new,
  name: r'nearbyViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nearbyViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NearbyViewModel = AutoDisposeAsyncNotifier<List<NearbyPlace>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
