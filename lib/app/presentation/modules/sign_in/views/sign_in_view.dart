import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/adaptative_screen/adaptive_screen.dart';
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
  const SignInView({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final signInController = ref.watch(signInProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: adaptiveScreen.bwh(2)),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [
                Icon(
                  EvaIcons.lock,
                  size: adaptiveScreen.dp(12),
                  color: AppColors.primary,
                ).center,
                adaptiveScreen.hp(2).h,
                Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: adaptiveScreen.dp(2.8),
                    color: AppColors.black100,
                  ),
                ),
                adaptiveScreen.hp(1).h,
                Text(
                  "Inicia sesión para continuar",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: adaptiveScreen.dp(2),
                  ),
                ),
              ],
            ).padding(EdgeInsets.only(top: adaptiveScreen.bhp(2))),

            adaptiveScreen.hp(5).h,

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
              padding: EdgeInsets.only(top: adaptiveScreen.bhp(2)),
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
              padding: EdgeInsets.only(top: adaptiveScreen.bhp(4)),
              adaptiveScreen: adaptiveScreen,
              label: 'Ingresar',
              onPressed: signInController.isFormValid
                  ? () => login(context)
                  : null,
            ),

            CustomTextGW.richText(
              padding: EdgeInsets.only(
                top: adaptiveScreen.bhp(20),
                bottom: adaptiveScreen.bhp(5),
              ),
              adaptiveScreen: adaptiveScreen,
              firstText: '¿No tienes cuenta? ',
              color: AppColors.black100,
              children: [
                TextSpan(
                  text: 'Regístrate aquí',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.pushNamed(SignUpRoute.path),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
