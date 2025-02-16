// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionHandlerServiceProvider =
    Provider<PermissionHandlerService>((ref) {
  return PermissionHandlerService();
});

class PermissionHandlerService {
  /// Requests a specific permission.
  /// Returns `true` if the permission is granted, otherwise `false`.
  Future<bool> requestPermission(PermissionType permission) async {
    final Permission _permission = getPermissionFromType(permission);
    var status = await _permission.status;

    // If permission is denied, request it.
    if (status.isDenied || status.isRestricted) {
      var result = await _permission.request();

      if (result.isGranted) {
        // Permission granted, handle as needed.
        return true;
      } else if (result.isDenied || result.isPermanentlyDenied) {
        // Open app settings for denied or permanently denied.
        await openAppSettings();
      }
    } else if (status.isGranted) {
      // Permission already granted.
      return true;
    }

    return false;
  }
}

/// Maps [PermissionType] to [Permission] from the permission_handler package.
Permission getPermissionFromType(PermissionType permissionType) {
  switch (permissionType) {
    case PermissionType.camera:
      return Permission.camera;

    case PermissionType.storage:
      return Permission.storage;

    case PermissionType.alwaysLocation:
      return Permission.locationAlways;

    case PermissionType.location:
      return Permission.location;

    case PermissionType.manageExternalStorage:
      return Permission.manageExternalStorage;

    case PermissionType.whenInUseLocation:
      return Permission.locationWhenInUse;
  }
}

/// Enum defining the types of permissions used in this app.
enum PermissionType {
  /// Camera permission
  camera,

  /// Read external storage (Android)
  storage,

  /// Manage external storage (Android)
  manageExternalStorage,

  /// General location access
  location,

  /// Always location access (iOS/Android)
  alwaysLocation,

  /// Location access only when the app is in use
  whenInUseLocation,
}
