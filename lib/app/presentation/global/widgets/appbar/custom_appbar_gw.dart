import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../text/custom_text_gw.dart';

abstract class CustomAppbarGW {
  CustomAppbarGW._();

  static AppBar simple({
    required BuildContext context,
    double? leadingWidth,
  }) {
    final adaptativeScreen = AdaptativeScreen(context);

    return AppBar(
      leadingWidth: leadingWidth ?? adaptativeScreen.bwh(40),
      leading: IconButton(
        icon: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: adaptativeScreen.bwh(1),
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.grey500,
              ),
            ),
            CustomTextGW.text(
              'Atrás',
              adaptativeScreen: adaptativeScreen,
              fontSize: adaptativeScreen.dp(1.7),
            ),
          ],
        ),
        onPressed: () => context.pop(),
      ),
    );
  }
}
