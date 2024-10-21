import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../btns/custom_btn_gw.dart';
import '../text/custom_text_gw.dart';

class InternetGW extends StatelessWidget {
  final void Function()? onPressed;
  const InternetGW({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(
      context,
    );
    return Padding(
      padding: EdgeInsets.only(
        top: adaptativeScreen.bhp(4),
      ),
      child: Column(
        children: [
          Icon(
            Icons.wifi_off_sharp,
            color: AppColors.grey200,
            size: adaptativeScreen.dp(9),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: adaptativeScreen.bhp(5),
            ),
            child: CustomTextGW.text(
              'no hay internet',
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
