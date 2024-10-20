import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';
import '../../../router/app_routes/contacts_route.dart';
import '../../../router/app_routes/sign_up_route.dart';

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
        InputTextFieldGW(
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
          onPressed: () => context.pushReplacement(
            ContactsRoute.path,
          ),
        ),
        CustomTextGW.richText(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(40),
            bottom: adaptativeScreen.bhp(5),
          ),
          adaptativeScreen: adaptativeScreen,
          firstText: 'Si no posee una cuenta ',
          color: AppColors.black100,
          children: [
            TextSpan(
              text: 'registrate aquí',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.pushNamed(SignUpRoute.path),
            ),
          ],
        ),
      ],
    );
  }
}
