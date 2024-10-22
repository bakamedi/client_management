import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_success.freezed.dart';

@freezed
class PermissionSuccess with _$PermissionSuccess {
  const factory PermissionSuccess.isGranted() = _PermissionGranted;
}
