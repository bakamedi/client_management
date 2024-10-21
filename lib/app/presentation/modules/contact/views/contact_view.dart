import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../extensions/widgets_ext.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';
import '../controller/contact_controller.dart';
import '../utils/contact_mode.dart';
import '../utils/delete_contact.dart';
import '../utils/update_contact.dart';

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
            onTap: () => updateContact(context),
            child: CustomTextGW.text(
              'Guardar',
              adaptativeScreen: adaptativeScreen,
              color: AppColors.primary,
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
          ),
          _buildInputField(
            label: 'Apellidos',
            hint: 'Escriba los apellidos',
            keyboardType: TextInputType.name,
            controller: contactController.textLastNameEditingController,
          ),
          _buildInputField(
            label: 'Número de teléfono',
            hint: 'Escriba el Teléfono',
            keyboardType: TextInputType.phone,
            controller: contactController.textPhoneNumberEditingController,
          ),
          _buildInputField(
            label: 'Número de celular',
            hint: 'Escriba el celular',
            keyboardType: TextInputType.phone,
            controller: contactController.textCellPhoneEditingController,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        contactController.urlProfile.isNotEmpty
            ? ExtendedImage.network(
                'url',
                width: adaptativeScreen.bwh(10),
                height: adaptativeScreen.bwh(10),
                fit: BoxFit.cover,
                shape: BoxShape.circle,
              )
            : CircleAvatar(
                radius: adaptativeScreen.dp(4),
                child: CustomTextGW.text(
                  'CH',
                  adaptativeScreen: adaptativeScreen,
                  fontSize: adaptativeScreen.dp(3.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
        Positioned(
          top: 55,
          bottom: 0,
          right: 0,
          left: adaptativeScreen.bwh(15),
          child: InkWell(
            onTap: () {
              // Acción al presionar el botón de editar
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary, // Color del fondo del icono
                shape: BoxShape.circle,
              ),
              child: Icon(
                EvaIcons.edit, // Icono de lápiz
                color: AppColors.white, // Color del icono
                size: adaptativeScreen.dp(1.5),
              ),
            ),
          ),
        ),
      ],
    ).sliverBox.sliverPadding(
          EdgeInsets.only(
            top: adaptativeScreen.bhp(5),
            bottom: adaptativeScreen.bhp(8),
          ),
        );
  }

  Widget _buildAvatar(ContactController contactController) {
    return GestureDetector(
      onTap: () {
        // Acción al presionar el botón de editar
      },
      child: SizedBox(
        height: adaptativeScreen.bhp(10),
        width: adaptativeScreen.bwh(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primary, // Color del fondo del icono
            shape: BoxShape.circle,
          ),
          child: Icon(
            EvaIcons.imageOutline, // Icono de lápiz
            color: AppColors.white, // Color del icono
            size: adaptativeScreen.dp(5),
          ),
        ),
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
  }) {
    return InputTextFieldGW(
      onChanged: (value) {},
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
