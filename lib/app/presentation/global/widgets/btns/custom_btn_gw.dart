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

  static Widget secondary({
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
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.resolveWith<Size>((
            Set<WidgetState> states,
          ) {
            return const Size(100, 50);
          }),
          shadowColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            return AppColors.white; // Defer to the widget's default.
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey400;
            }
            return AppColors.white; // Use the component's default.
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.red.withValues(alpha: 0.8),
                width: 1.0,
              ),
            ),
          ),
        ),
        child: CustomTextGW.text(
          label,
          color: Colors.red.withValues(alpha: .8),
          adaptativeScreen: adaptativeScreen,
          fontSize: fontSizeResponsive,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
