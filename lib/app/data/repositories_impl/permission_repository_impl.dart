import 'package:permission_handler/permission_handler.dart';

import '../../domain/either.dart';
import '../../domain/models/permission/failure/permission_failure.dart';
import '../../domain/models/permission/success/permission_success.dart';
import '../../domain/respositories/permission_repository.dart';
import '../../domain/typedefs.dart';
import '../data_source/local/permission_local.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  PermissionRepositoryImpl({required PermissionLocal permissionLocal})
    : _permissionLocal = permissionLocal;
  final PermissionLocal _permissionLocal;

  @override
  FutureEither<PermissionFailure, PermissionSuccess> requestPermission(
    Permission permission,
  ) async {
    final status = await _permissionLocal.request(permission);
    switch (status) {
      case PermissionStatus.granted:
        return const Either.right(PermissionSuccess.isGranted());
      case PermissionStatus.denied:
        return const Either.left(PermissionFailure.denied());
      case PermissionStatus.permanentlyDenied:
        return const Either.left(PermissionFailure.permanentlyDenied());
      case PermissionStatus.limited:
        return const Either.left(PermissionFailure.limited());
      case PermissionStatus.provisional:
        return const Either.left(PermissionFailure.provisional());
      default:
        return const Either.left(PermissionFailure.isUnknown());
    }
  }
}
