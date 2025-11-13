import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../btns/custom_btn_gw.dart';
import '../text/custom_text_gw.dart';

class ErrorGW extends StatelessWidget {
  const ErrorGW({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(context);
    return Padding(
      padding: EdgeInsets.only(top: adaptativeScreen.bhp(4)),
      child: Column(
        children: [
          Icon(
            Icons.error,
            color: AppColors.grey200,
            size: adaptativeScreen.dp(9),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: adaptativeScreen.bhp(5)),
            child: CustomTextGW.text(
              'Error al cargar los datos',
              adaptativeScreen: adaptativeScreen,
              fontSize: adaptativeScreen.dp(1.5),
              color: AppColors.grey500,
            ),
          ),
          CustomBtnGW.primary(
            label: 'Intentar nuevamente',
            adaptativeScreen: adaptativeScreen,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
