// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dham_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dhamDetailViewModelHash() =>
    r'1e047dff4f00c103ee84ba7909e025a3865a50af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DhamDetailViewModel
    extends BuildlessAutoDisposeAsyncNotifier<DhamDetailModel> {
  late final String dhamId;

  FutureOr<DhamDetailModel> build(
    String dhamId,
  );
}

/// See also [DhamDetailViewModel].
@ProviderFor(DhamDetailViewModel)
const dhamDetailViewModelProvider = DhamDetailViewModelFamily();

/// See also [DhamDetailViewModel].
class DhamDetailViewModelFamily extends Family<AsyncValue<DhamDetailModel>> {
  /// See also [DhamDetailViewModel].
  const DhamDetailViewModelFamily();

  /// See also [DhamDetailViewModel].
  DhamDetailViewModelProvider call(
    String dhamId,
  ) {
    return DhamDetailViewModelProvider(
      dhamId,
    );
  }

  @override
  DhamDetailViewModelProvider getProviderOverride(
    covariant DhamDetailViewModelProvider provider,
  ) {
    return call(
      provider.dhamId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dhamDetailViewModelProvider';
}

/// See also [DhamDetailViewModel].
class DhamDetailViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DhamDetailViewModel, DhamDetailModel> {
  /// See also [DhamDetailViewModel].
  DhamDetailViewModelProvider(
    String dhamId,
  ) : this._internal(
          () => DhamDetailViewModel()..dhamId = dhamId,
          from: dhamDetailViewModelProvider,
          name: r'dhamDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dhamDetailViewModelHash,
          dependencies: DhamDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              DhamDetailViewModelFamily._allTransitiveDependencies,
          dhamId: dhamId,
        );

  DhamDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dhamId,
  }) : super.internal();

  final String dhamId;

  @override
  FutureOr<DhamDetailModel> runNotifierBuild(
    covariant DhamDetailViewModel notifier,
  ) {
    return notifier.build(
      dhamId,
    );
  }

  @override
  Override overrideWith(DhamDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DhamDetailViewModelProvider._internal(
        () => create()..dhamId = dhamId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dhamId: dhamId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DhamDetailViewModel, DhamDetailModel>
      createElement() {
    return _DhamDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DhamDetailViewModelProvider && other.dhamId == dhamId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dhamId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DhamDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<DhamDetailModel> {
  /// The parameter `dhamId` of this provider.
  String get dhamId;
}

class _DhamDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DhamDetailViewModel,
        DhamDetailModel> with DhamDetailViewModelRef {
  _DhamDetailViewModelProviderElement(super.provider);

  @override
  String get dhamId => (origin as DhamDetailViewModelProvider).dhamId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
