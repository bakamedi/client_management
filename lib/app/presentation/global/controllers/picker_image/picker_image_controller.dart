import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../domain/respositories/permission_repository.dart';
import '../../../../injection_providers.dart';
import 'picker_image_state.dart';

final pickerImageProvider =
    Provider.state<PickerImageController, PickerImageState>(
  (_) => PickerImageController(
    PickerImageState.initialState,
    permissionRepository: Repositories.permissionRep.read(),
  ),
);

class PickerImageController extends StateNotifier<PickerImageState> {
  final PermissionRepository _permissionRepository;

  PickerImageController(
    super.initialState, {
    required PermissionRepository permissionRepository,
  }) : _permissionRepository = permissionRepository;

  Future<String?> pickerImage() async {
    final resultPermission = await _permissionRepository.requestPermission(
      Permission.photos,
    );
    return resultPermission.when(
      left: (failure) {
        onlyUpdate(state = state.copyWith(failure: failure));
        return null;
      },
      right: (success) {
        onlyUpdate(state = state.copyWith(success: success));

        return _pickImageHandler();
      },
    );
  }

  Future<String?> _pickImageHandler() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) {
      return null;
    } else {
      final filePath = result.files.first.path;
      return filePath;
    }
  }
}
