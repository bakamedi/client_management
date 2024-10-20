import 'package:client_management/app/presentation/global/widgets/btns/custom_btn_gw.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';

class SignUpView extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;
  const SignUpView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextFieldGW(
          padding: EdgeInsets.symmetric(vertical: adaptativeScreen.bhp(1)),
          labelTxt: 'Nombres',
          backgroundLabel: 'Escriba su correo',
          onChanged: (value) {},
        ),
        InputTextFieldGW(
          padding: EdgeInsets.symmetric(vertical: adaptativeScreen.bhp(1)),
          labelTxt: 'Apellidos',
          backgroundLabel: 'Escriba su correo',
          onChanged: (value) {},
        ),
        InputTextFieldGW(
          padding: EdgeInsets.symmetric(vertical: adaptativeScreen.bhp(1)),
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
        InputTextFieldGW(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(2),
          ),
          labelTxt: 'Confirme su Contraseña',
          backgroundLabel: 'Vuelva a escribir su contraseña',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {},
        ),
        CustomBtnGW.primary(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(5),
          ),
          adaptativeScreen: adaptativeScreen,
          label: 'Registrar',
          onPressed: () {},
        ),
      ],
    );
  }
}
