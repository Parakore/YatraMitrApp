// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$disasterServiceHash() => r'80902c14671e55d23a499403a16e132dcf5b48d3';

/// See also [disasterService].
@ProviderFor(disasterService)
final disasterServiceProvider = AutoDisposeProvider<DisasterService>.internal(
  disasterService,
  name: r'disasterServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disasterServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DisasterServiceRef = AutoDisposeProviderRef<DisasterService>;
String _$disasterRepositoryHash() =>
    r'90e2c70aec109781cf3a72cf7f6f2260fa1651e2';

/// See also [disasterRepository].
@ProviderFor(disasterRepository)
final disasterRepositoryProvider =
    AutoDisposeProvider<DisasterRepository>.internal(
  disasterRepository,
  name: r'disasterRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disasterRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DisasterRepositoryRef = AutoDisposeProviderRef<DisasterRepository>;
String _$weatherForecastHash() => r'9dc6f32c21d1f32c081382467a10533c802cafd3';

/// See also [weatherForecast].
@ProviderFor(weatherForecast)
final weatherForecastProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  weatherForecast,
  name: r'weatherForecastProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherForecastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherForecastRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$alertViewModelHash() => r'd8d169d402a4dcb0c4d352b0299cbfda552c98fc';

/// See also [AlertViewModel].
@ProviderFor(AlertViewModel)
final alertViewModelProvider = AutoDisposeAsyncNotifierProvider<AlertViewModel,
    List<DisasterAlert>>.internal(
  AlertViewModel.new,
  name: r'alertViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alertViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlertViewModel = AutoDisposeAsyncNotifier<List<DisasterAlert>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
