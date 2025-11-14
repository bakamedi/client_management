import 'package:client_management/app/presentation/modules/contact/views/widgets/avatar_contact_edit_w.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
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
  const ContactView({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final ContactController contactController = ref.watch(contactProvider);

    return Scaffold(
      appBar: AppBar(
        title: CustomTextGW.text(
          '',
          adaptiveScreen: adaptiveScreen,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          GestureDetector(
            onTap: contactController.isFormValid
                ? () => selectMode(context)
                : null,
            child: CustomTextGW.text(
              'Guardar',
              adaptiveScreen: adaptiveScreen,
              color: contactController.isFormValid
                  ? AppColors.white
                  : AppColors.grey300,
              fontWeight: FontWeight.bold,
            ).padding(EdgeInsets.only(right: adaptiveScreen.bwh(6))),
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
            maxLength: 10,
            controller: contactController.textPhoneNumberEditingController,
            contactController: contactController,
          ),
          _buildInputField(
            label: 'Número de celular',
            hint: 'Escriba el celular',
            keyboardType: TextInputType.phone,
            maxLength: 10,
            controller: contactController.textCellPhoneEditingController,
            contactController: contactController,
          ),
          contactController.contactMode == ContactMode.edit
              ? CustomBtnGW.secondary(
                  onPressed: () => deleteContact(context),
                  margin: EdgeInsets.only(
                    top: adaptiveScreen.bhp(26),
                    left: adaptiveScreen.bwh(10),
                    right: adaptiveScreen.bwh(10),
                  ),
                  adaptiveScreen: adaptiveScreen,
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
        : AvatarContactEditW(
            adaptiveScreen: adaptiveScreen,
            contactController: contactController,
          );
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
                size: adaptiveScreen.dp(1.7),
              ),
            ),
          ).padding(EdgeInsets.only(top: adaptiveScreen.bhp(1))),
        ),
      ],
    ).sliverBox.sliverPadding(
      EdgeInsets.only(
        top: adaptiveScreen.bhp(5),
        bottom: adaptiveScreen.bhp(8),
      ),
    );
  }

  Widget _buildImage(ContactController contactController) {
    if (contactController.urlProfile.isNotEmpty) {
      if (contactController.fileProfile != null) {
        return ExtendedImage.file(
          contactController.fileProfile!,
          width: adaptiveScreen.bwh(40),
          height: adaptiveScreen.bwh(40),
          fit: BoxFit.cover,
          shape: BoxShape.circle,
        );
      }
      if (contactController.internet) {
        return CircleAvatar(
          radius: adaptiveScreen.dp(5),
          child: CustomTextGW.text(
            contactController.contact!.initials,
            adaptiveScreen: adaptiveScreen,
            fontSize: adaptiveScreen.dp(3.5),
            fontWeight: FontWeight.bold,
          ),
        );
      }
      return ExtendedImage.network(
        contactController.contact!.profileImage!.getUrlProfile,
        width: adaptiveScreen.bwh(40),
        height: adaptiveScreen.bwh(40),
        fit: BoxFit.cover,
        shape: BoxShape.circle,
      );
    }
    if (contactController.fileProfile != null) {
      return ExtendedImage.file(
        contactController.fileProfile!,
        width: adaptiveScreen.bwh(40),
        height: adaptiveScreen.bwh(40),
        fit: BoxFit.cover,
        shape: BoxShape.circle,
      );
    }
    return contactController.urlProfile.isNotEmpty &&
            !contactController.internet
        ? ExtendedImage.network(
            contactController.contact!.profileImage!.getUrlProfile,
            width: adaptiveScreen.bwh(40),
            height: adaptiveScreen.bwh(40),
            fit: BoxFit.cover,
            shape: BoxShape.circle,
          )
        : CircleAvatar(
            radius: adaptiveScreen.dp(5),
            child: CustomTextGW.text(
              contactController.contact!.initials,
              adaptiveScreen: adaptiveScreen,
              fontSize: adaptiveScreen.dp(3.5),
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextInputType keyboardType,
    required TextEditingController? controller,
    required ContactController contactController,
    int? maxLength,
  }) {
    return InputTextFieldGW(
      onChanged: (value) => contactController.validateForm(),
      labelTxt: label,
      backgroundLabel: hint,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
    ).sliverBox.sliverPadding(
      EdgeInsets.symmetric(
        horizontal: adaptiveScreen.bwh(10),
        vertical: adaptiveScreen.bhp(1),
      ),
    );
  }
}
