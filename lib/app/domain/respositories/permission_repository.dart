import 'package:permission_handler/permission_handler.dart';

import '../models/permission/failure/permission_failure.dart';
import '../models/permission/success/permission_success.dart';
import '../typedefs.dart';

abstract class PermissionRepository {
  FutureEither<PermissionFailure, PermissionSuccess> requestPermission(
    Permission permission,
  );
}
