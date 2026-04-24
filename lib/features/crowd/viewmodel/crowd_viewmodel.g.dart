// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowd_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crowdServiceHash() => r'35aac60753cfca14c9ef28301a8e7a38d1d2d0f1';

/// See also [crowdService].
@ProviderFor(crowdService)
final crowdServiceProvider = AutoDisposeProvider<CrowdService>.internal(
  crowdService,
  name: r'crowdServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$crowdServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CrowdServiceRef = AutoDisposeProviderRef<CrowdService>;
String _$crowdRepositoryHash() => r'a9d1be004ffb0bc8011913943d0f165dc318ed1e';

/// See also [crowdRepository].
@ProviderFor(crowdRepository)
final crowdRepositoryProvider = AutoDisposeProvider<CrowdRepository>.internal(
  crowdRepository,
  name: r'crowdRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crowdRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CrowdRepositoryRef = AutoDisposeProviderRef<CrowdRepository>;
String _$crowdViewModelHash() => r'61d23b1d13aeb746778bc6bbb8375c0b2411edce';

/// See also [CrowdViewModel].
@ProviderFor(CrowdViewModel)
final crowdViewModelProvider = AutoDisposeAsyncNotifierProvider<CrowdViewModel,
    List<CrowdStatus>>.internal(
  CrowdViewModel.new,
  name: r'crowdViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crowdViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CrowdViewModel = AutoDisposeAsyncNotifier<List<CrowdStatus>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
