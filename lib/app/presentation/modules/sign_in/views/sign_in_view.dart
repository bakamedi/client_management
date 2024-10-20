import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/utils/update_field_gu.dart';
import '../../../../core/utils/widget_gu.dart';
import '../../../global/utils/user_validators_gu.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../../../global/widgets/text/custom_text_gw.dart';
import '../../../router/app_routes/sign_up_route.dart';
import '../controller/sign_in_controller.dart';
import '../utils/login.dart';

class SignInView extends ConsumerWidget {
  final AdaptativeScreen adaptativeScreen;
  const SignInView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final signInController = ref.watch(signInProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTextFieldGW(
          onChanged: (value) => signInController.onChangeField(
            UpdateFieldGU.email,
            value: value,
          ),
          labelTxt: 'Correo',
          backgroundLabel: 'Escriba su correo',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: UserValidator.validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        InputTextFieldGW(
          onChanged: (value) => signInController.onChangeField(
            UpdateFieldGU.password,
            value: value,
          ),
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(2),
          ),
          labelTxt: 'Contraseña',
          backgroundLabel: 'Escriba su contraseña',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: UserValidator.validatePassword,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !signInController.showPassword,
          suffixInput: GestureDetector(
            onTap: signInController.togglePasswordVisibility,
            child: WidgetGU.showEyeIcon(
              show: signInController.showPassword,
            ),
          ),
        ),
        CustomBtnGW.primary(
          padding: EdgeInsets.only(
            top: adaptativeScreen.bhp(3),
          ),
          adaptativeScreen: adaptativeScreen,
          label: 'Ingresar',
          onPressed: signInController.isFormValid
              ? () => login(
                    context,
                  )
              : null,
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
