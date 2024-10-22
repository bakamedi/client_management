import 'dart:io';

import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../extensions/widgets_ext.dart';
import '../../../extensions/strings_ext.dart';
import '../../../extensions/contacts_ext.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/gestures/picker_image_gesture_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';
import '../controller/contact_controller.dart';
import '../utils/contact_mode.dart';
import '../utils/delete_contact.dart';
import '../utils/select_mode.dart';

class ContactView extends ConsumerWidget {
  final AdaptativeScreen adaptativeScreen;

  const ContactView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final ContactController contactController = ref.watch(
      contactProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: CustomTextGW.text(
          '',
          adaptativeScreen: adaptativeScreen,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          GestureDetector(
            onTap: contactController.isFormValid
                ? () => selectMode(context)
                : null,
            child: CustomTextGW.text(
              'Guardar',
              adaptativeScreen: adaptativeScreen,
              color: contactController.isFormValid
                  ? AppColors.primary
                  : AppColors.grey300,
              fontWeight: FontWeight.bold,
            ).padding(
              EdgeInsets.only(
                right: adaptativeScreen.bwh(6),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _buildTitle(contactController),
          _buildInputField(
            label: 'Nombres',
            hint: 'Escriba los nombres',
            keyboardType: TextInputType.name,
            controller: contactController.textNamesEditingController,
            contactController: contactController,
          ),
          _buildInputField(
            label: 'Apellidos',
            hint: 'Escriba los apellidos',
            keyboardType: TextInputType.name,
            controller: contactController.textLastNameEditingController,
            contactController: contactController,
          ),
          _buildInputField(
            label: 'Número de teléfono',
            hint: 'Escriba el Teléfono',
            keyboardType: TextInputType.phone,
            controller: contactController.textPhoneNumberEditingController,
            contactController: contactController,
          ),
          _buildInputField(
            label: 'Número de celular',
            hint: 'Escriba el celular',
            keyboardType: TextInputType.phone,
            controller: contactController.textCellPhoneEditingController,
            contactController: contactController,
          ),
          contactController.contactMode == ContactMode.edit
              ? CustomBtnGW.secondary(
                  onPressed: () => deleteContact(context),
                  margin: EdgeInsets.only(
                    top: adaptativeScreen.bhp(26),
                    left: adaptativeScreen.bwh(10),
                    right: adaptativeScreen.bwh(10),
                  ),
                  adaptativeScreen: adaptativeScreen,
                  label: 'Eliminar',
                ).sliverBox
              : 1.h.sliverBox,
        ],
      ),
    );
  }

  Widget _buildTitle(ContactController contactController) {
    return contactController.contactMode == ContactMode.edit
        ? _buildHeading(contactController)
        : _buildAvatar(contactController);
  }

  Widget _buildHeading(ContactController contactController) {
    return Column(
      children: [
        _buildImage(contactController),
        PickerImageGestureGW(
          onImageSelected: (filePath) {
            contactController.changeFileProfile(filePath);
          },
          child: SizedBox(
            height: 30,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.image,
                color: AppColors.white,
                size: adaptativeScreen.dp(1.7),
              ),
            ),
          ).padding(EdgeInsets.only(top: adaptativeScreen.bhp(1))),
        ),
      ],
    ).sliverBox.sliverPadding(
          EdgeInsets.only(
            top: adaptativeScreen.bhp(5),
            bottom: adaptativeScreen.bhp(8),
          ),
        );
  }

  Widget _buildImage(ContactController contactController) {
    if (contactController.urlProfile.isNotEmpty) {
      if (contactController.internet) {
        return CircleAvatar(
          radius: adaptativeScreen.dp(5),
          child: CustomTextGW.text(
            contactController.contact!.initials,
            adaptativeScreen: adaptativeScreen,
            fontSize: adaptativeScreen.dp(3.5),
            fontWeight: FontWeight.bold,
          ),
        );
      }
      return ExtendedImage.network(
        contactController.contact!.profileImage!.getUrlProfile,
        width: adaptativeScreen.bwh(40),
        height: adaptativeScreen.bwh(40),
        fit: BoxFit.cover,
        shape: BoxShape.circle,
      );
    }
    return contactController.urlProfile.isNotEmpty &&
            !contactController.internet
        ? ExtendedImage.network(
            contactController.contact!.profileImage!.getUrlProfile,
            width: adaptativeScreen.bwh(40),
            height: adaptativeScreen.bwh(40),
            fit: BoxFit.cover,
            shape: BoxShape.circle,
          )
        : CircleAvatar(
            radius: adaptativeScreen.dp(5),
            child: CustomTextGW.text(
              contactController.contact!.initials,
              adaptativeScreen: adaptativeScreen,
              fontSize: adaptativeScreen.dp(3.5),
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _buildAvatar(ContactController contactController) {
    return PickerImageGestureGW(
      onImageSelected: (filePath) {
        contactController.changeFileProfile(filePath);
      },
      child: CircleAvatar(
        radius: adaptativeScreen.dp(5),
        backgroundImage: contactController.fileProfile != null
            ? FileImage(
                File(contactController.fileProfile!.path),
              )
            : null,
        child: contactController.fileProfile == null
            ? Icon(
                EvaIcons.imageOutline,
                color: AppColors.white,
                size: adaptativeScreen.dp(3.5),
              )
            : null,
      ),
    ).sliverBox.sliverPadding(
          EdgeInsets.only(
            top: adaptativeScreen.bhp(5),
            bottom: adaptativeScreen.bhp(8),
          ),
        );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextInputType keyboardType,
    required TextEditingController? controller,
    required ContactController contactController,
  }) {
    return InputTextFieldGW(
      onChanged: (value) => contactController.validateForm(),
      labelTxt: label,
      backgroundLabel: hint,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
    ).sliverBox.sliverPadding(
          EdgeInsets.symmetric(
            horizontal: adaptativeScreen.bwh(10),
            vertical: adaptativeScreen.bhp(1),
          ),
        );
  }
}
