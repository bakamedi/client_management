import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionLocal {
  PermissionLocal();

  Future<PermissionStatus?> request(
    Permission permission,
  ) async {
    try {
      final status = await permission.request();
      return status;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
