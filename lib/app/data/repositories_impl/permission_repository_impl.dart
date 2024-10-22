import 'package:permission_handler/permission_handler.dart';

import '../../domain/either.dart';
import '../../domain/models/permission/failure/permission_failure.dart';
import '../../domain/models/permission/success/permission_success.dart';
import '../../domain/respositories/permission_repository.dart';
import '../../domain/typedefs.dart';
import '../data_source/local/permission_local.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  final PermissionLocal _permissionLocal;
  PermissionRepositoryImpl({
    required PermissionLocal permissionLocal,
  }) : _permissionLocal = permissionLocal;

  @override
  FutureEither<PermissionFailure, PermissionSuccess> requestPermission(
    Permission permission,
  ) async {
    final status = await _permissionLocal.request(permission);
    switch (status) {
      case PermissionStatus.granted:
        return Either.right(PermissionSuccess.isGranted());
      case PermissionStatus.denied:
        return Either.left(PermissionFailure.denied());
      case PermissionStatus.permanentlyDenied:
        return Either.left(PermissionFailure.permanentlyDenied());
      case PermissionStatus.limited:
        return Either.left(PermissionFailure.limited());
      case PermissionStatus.provisional:
        return Either.left(PermissionFailure.provisional());
      default:
        return Either.left(PermissionFailure.isUnknown());
    }
  }
}
