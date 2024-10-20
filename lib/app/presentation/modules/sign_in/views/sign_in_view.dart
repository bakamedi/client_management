import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../extensions/widgets_ext.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';

class SignInView extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;
  const SignInView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextGW.text(
          'Bienvenido',
          adaptativeScreen: adaptativeScreen,
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(10),
          ),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        InputTextFieldGW(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(2),
          ),
          labelTxt: 'Correo',
          backgroundLabel: 'Escriba su correo',
          onChanged: (value) {},
        ),
        InputTextFieldGW(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(2),
          ),
          labelTxt: 'Contraseña',
          backgroundLabel: 'Escriba su contraseña',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {},
        ),
        CustomBtnGW.primary(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(3),
          ),
          adaptativeScreen: adaptativeScreen,
          label: 'Ingresar',
          onPressed: () {},
        ),
        1.h.expanded,
        CustomTextGW.richText(
          padding: EdgeInsets.only(
            bottom: adaptativeScreen.bhp(
              5,
            ),
          ),
          adaptativeScreen: adaptativeScreen,
          firstText: 'Si no posee una cuenta ',
          color: Colors.black,
          children: [
            TextSpan(
              text: 'registrate aquí',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ],
    );
  }
}
