import 'dart:io';

import 'package:client_management/app/core/adaptative_screen/adaptive_screen.dart';
import 'package:client_management/app/core/theme/app_colors.dart';
import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:client_management/app/presentation/global/widgets/gestures/picker_image_gesture_gw.dart';
import 'package:client_management/app/presentation/modules/contact/controller/contact_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AvatarContactEditW extends StatelessWidget {
  const AvatarContactEditW({
    super.key,
    required this.adaptiveScreen,
    required this.contactController,
  });
  final AdaptiveScreen adaptiveScreen;
  final ContactController contactController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: adaptiveScreen.dp(5),
          backgroundColor: AppColors.primary.withValues(alpha: 0.6),
          backgroundImage: contactController.fileProfile != null
              ? FileImage(File(contactController.fileProfile!.path))
              : null,
          child: contactController.fileProfile == null
              ? Icon(
                  EvaIcons.imageOutline,
                  color: AppColors.white,
                  size: adaptiveScreen.dp(3.5),
                )
              : null,
        ),

        Positioned(
          bottom: 0,
          right: adaptiveScreen.wp(35),
          child: PickerImageGestureGW(
            onImageSelected: (filePath) =>
                contactController.changeFileProfile(filePath),
            child: Container(
              padding: EdgeInsets.all(adaptiveScreen.dp(0.8)),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                EvaIcons.edit2Outline,
                color: AppColors.white,
                size: adaptiveScreen.dp(1.8),
              ),
            ),
          ),
        ),
      ],
    ).sliverBox.sliverPadding(
      EdgeInsets.only(
        top: adaptiveScreen.bhp(5),
        bottom: adaptiveScreen.bhp(8),
      ),
    );
  }
}
