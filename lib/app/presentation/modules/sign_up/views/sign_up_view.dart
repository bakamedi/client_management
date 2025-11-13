import 'package:client_management/app/core/theme/app_colors.dart';
import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../core/utils/create_field_gu.dart';
import '../../../../core/utils/user_validators_gu.dart';
import '../../../../core/utils/widget_gu.dart';
import '../../../global/widgets/btns/custom_btn_gw.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';
import '../controller/sign_up_controller.dart';
import '../utils/register.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final signUpController = ref.watch(signUpProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Icon(
                EvaIcons.personAdd,
                size: adaptiveScreen.dp(12),
                color: AppColors.primary,
              ).center,
              adaptiveScreen.hp(2).h,
              Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: adaptiveScreen.dp(3),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black100,
                ),
              ),
              adaptiveScreen.hp(1).h,
              Text(
                "Completa los campos para registrarte",
                style: TextStyle(
                  fontSize: adaptiveScreen.dp(2),
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),

          adaptiveScreen.hp(4).h,

          InputTextFieldGW(
            onChanged: (value) => signUpController.onChangeField(
              CreateFieldGU.names,
              value: value,
            ),
            padding: EdgeInsets.symmetric(vertical: adaptiveScreen.bhp(1)),
            labelTxt: 'Nombres',
            backgroundLabel: 'Escriba su nombre',
          ),
          InputTextFieldGW(
            onChanged: (value) => signUpController.onChangeField(
              CreateFieldGU.lastName,
              value: value,
            ),
            padding: EdgeInsets.symmetric(vertical: adaptiveScreen.bhp(1)),
            labelTxt: 'Apellidos',
            backgroundLabel: 'Escriba su apellido',
          ),
          InputTextFieldGW(
            onChanged: (value) => signUpController.onChangeField(
              CreateFieldGU.email,
              value: value,
            ),
            padding: EdgeInsets.symmetric(vertical: adaptiveScreen.bhp(1)),
            labelTxt: 'Correo electrónico',
            backgroundLabel: 'Escriba su correo',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: UserValidator.validateEmail,
          ),
          InputTextFieldGW(
            onChanged: (value) => signUpController.onChangeField(
              CreateFieldGU.password,
              value: value,
            ),
            padding: EdgeInsets.only(top: adaptiveScreen.bhp(2)),
            labelTxt: 'Contraseña',
            backgroundLabel: 'Escriba su contraseña',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: UserValidator.validatePassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !signUpController.showPassword,
            suffixInput: GestureDetector(
              onTap: signUpController.togglePasswordVisibility,
              child: WidgetGU.showEyeIcon(show: signUpController.showPassword),
            ),
          ),
          InputTextFieldGW(
            onChanged: (value) => signUpController.onChangeField(
              CreateFieldGU.confirmPassword,
              value: value,
            ),
            padding: EdgeInsets.only(top: adaptiveScreen.bhp(2)),
            labelTxt: 'Confirmar contraseña',
            backgroundLabel: 'Vuelva a escribir su contraseña',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => UserValidator.confirmPassword(
              signUpController.password,
              signUpController.confirmPassword,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: !signUpController.showPassword,
            suffixInput: GestureDetector(
              onTap: signUpController.togglePasswordVisibility,
              child: WidgetGU.showEyeIcon(show: signUpController.showPassword),
            ),
          ),

          CustomBtnGW.primary(
            padding: EdgeInsets.only(top: adaptiveScreen.bhp(5)),
            adaptiveScreen: adaptiveScreen,
            label: 'Registrar',
            onPressed: signUpController.isFormValid
                ? () => register(context)
                : null,
          ),
        ],
      ).padding(EdgeInsets.symmetric(horizontal: adaptiveScreen.bwh(2))),
    );
  }
}
