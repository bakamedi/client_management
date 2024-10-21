import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../extensions/widgets_ext.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';

class ContactView extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;

  const ContactView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextGW.text(
          'Perfil',
          adaptativeScreen: adaptativeScreen,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: CustomTextGW.text(
              'Guardar',
              adaptativeScreen: adaptativeScreen,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ).padding(
              EdgeInsets.only(
                right: adaptativeScreen.bwh(2),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _buildHeading(),
          _buildInputField(
            label: 'Nombres',
            hint: 'Escriba los nombres',
            keyboardType: TextInputType.name,
          ),
          _buildInputField(
            label: 'Apellidos',
            hint: 'Escriba los apellidos',
            keyboardType: TextInputType.name,
          ),
          _buildInputField(
            label: 'Número Teléfono',
            hint: 'Escriba el Teléfono',
            keyboardType: TextInputType.phone,
          ),
          _buildInputField(
            label: 'Número de celular',
            hint: 'Escriba el celular',
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Stack(
      alignment: Alignment.center,
      children: [
        false
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
          child: GestureDetector(
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextInputType keyboardType,
  }) {
    return InputTextFieldGW(
      onChanged: (value) {},
      labelTxt: label,
      backgroundLabel: hint,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
    ).sliverBox.sliverPadding(
          EdgeInsets.symmetric(
            horizontal: adaptativeScreen.bwh(10),
            vertical: adaptativeScreen.bhp(1),
          ),
        );
  }
}
