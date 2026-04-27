// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionServiceHash() => r'fe3e662a4e57be22c3fd38d399fcaaa3f309480f';

/// Service responsible for handling app-wide permissions.
/// Adheres to production standards and handles various permission states.
///
/// Copied from [PermissionService].
@ProviderFor(PermissionService)
final permissionServiceProvider =
    AutoDisposeNotifierProvider<PermissionService, void>.internal(
  PermissionService.new,
  name: r'permissionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$permissionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PermissionService = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
