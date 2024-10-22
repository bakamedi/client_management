import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_failure.freezed.dart';

@freezed
class PermissionFailure with _$PermissionFailure {
  const factory PermissionFailure.isUnknown() = _IsUnknown;
  const factory PermissionFailure.denied() = _Denied;
  const factory PermissionFailure.permanentlyDenied() = _PermanentlyDenied;
  const factory PermissionFailure.limited() = _Limited;
  const factory PermissionFailure.provisional() = _Provisional;
}
