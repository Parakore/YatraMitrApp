import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_service.g.dart';

/// Service responsible for handling app-wide permissions.
/// Adheres to production standards and handles various permission states.
@riverpod
class PermissionService extends _$PermissionService {
  @override
  void build() {}

  /// Requests notification permissions.
  /// Should be called on app startup or home screen.
  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isGranted) return true;

    final result = await Permission.notification.request();
    return result.isGranted;
  }

  /// Requests camera permission.
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) return true;

    final result = await Permission.camera.request();
    return result.isGranted;
  }

  /// Requests gallery (photo library) permission.
  Future<bool> requestGalleryPermission() async {
    final status = await Permission.photos.status;
    if (status.isGranted) return true;

    final result = await Permission.photos.request();
    return result.isGranted;
  }

  /// Checks if a specific permission is granted.
  Future<bool> isPermissionGranted(Permission permission) async {
    return await permission.isGranted;
  }

  /// Opens app settings if permission is permanently denied.
  Future<void> handlePermanentlyDenied() async {
    await openAppSettings();
  }
}
