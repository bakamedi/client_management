import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/permission/failure/permission_failure.dart';
import '../../../../domain/models/permission/success/permission_success.dart';

part 'picker_image_state.freezed.dart';

@freezed
class PickerImageState with _$PickerImageState {
  const PickerImageState._();

  const factory PickerImageState({
    PermissionFailure? failure,
    PermissionSuccess? success,
  }) = _PickerImageState;

  static PickerImageState get initialState => const PickerImageState();
}
