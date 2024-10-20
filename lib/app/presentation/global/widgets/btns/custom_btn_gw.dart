import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../text/custom_text_gw.dart';

abstract class CustomBtnGW {
  CustomBtnGW._();

  static Widget primary({
    required AdaptativeScreen adaptativeScreen,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    required String label,
    IconData? icon,
    double? fontSize,
    ButtonStyle? style,
    void Function()? onPressed,
  }) {
    final fontSizeResponsive = adaptativeScreen.dp(1.5);

    return Container(
      margin: margin,
      padding: padding,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: CustomTextGW.text(
          label,
          color: AppColors.white,
          adaptativeScreen: adaptativeScreen,
          fontSize: fontSizeResponsive,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
