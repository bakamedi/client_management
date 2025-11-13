import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../btns/custom_btn_gw.dart';
import '../text/custom_text_gw.dart';

class ErrorGW extends StatelessWidget {
  const ErrorGW({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final adaptiveScreen = AdaptiveScreen(context);
    return Padding(
      padding: EdgeInsets.only(top: adaptiveScreen.bhp(4)),
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: AppColors.grey200,
            size: adaptiveScreen.dp(9),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: adaptiveScreen.bhp(5)),
            child: CustomTextGW.text(
              'Error al cargar los datos',
              adaptiveScreen: adaptiveScreen,
              fontSize: adaptiveScreen.dp(1.5),
              color: AppColors.grey500,
            ),
          ),
          CustomBtnGW.primary(
            label: 'Intentar nuevamente',
            adaptiveScreen: adaptiveScreen,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
