import 'package:flutter/material.dart';

import '../../controllers/picker_image/picker_image_controller.dart';

class PickerImageGestureGW extends StatelessWidget {
  final Widget child;
  final Function(String filePath)? onImageSelected;

  const PickerImageGestureGW({
    super.key,
    required this.child,
    this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final PickerImageController pickerImageController =
        pickerImageProvider.read();
    return InkWell(
      onTap: () async {
        final filePath = await pickerImageController.pickerImage();
        if (filePath == null) {
          return;
        } else {
          onImageSelected!(
            filePath,
          );
        }
      },
      child: child,
    );
  }
}
