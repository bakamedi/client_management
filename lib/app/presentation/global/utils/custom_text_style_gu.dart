import 'package:flutter/material.dart';

import '../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../core/theme/app_colors.dart';

abstract class CustomTextStyleGU {
  CustomTextStyleGU._();

  static const double _wordSpacing = 0.5;
  static const double _letterSpacing = 0.5;

  static TextStyle _baseTextStyle({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      wordSpacing: _wordSpacing,
      letterSpacing: _letterSpacing,
      decoration: decoration,
      overflow: overflow,
    );
  }

  static TextStyle mainTitle(AdaptiveScreen adaptiveScreen) {
    return _baseTextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w800,
      fontSize: adaptiveScreen.dp(2.5),
    );
  }

  static TextStyle title(AdaptiveScreen adaptiveScreen) {
    return _baseTextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w600,
      fontSize: adaptiveScreen.dp(2),
    );
  }

  static TextStyle subtitle(
    AdaptiveScreen adaptiveScreen, {
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.black100,
      fontWeight: FontWeight.w700,
      fontSize: adaptiveScreen.dp(1.8),
      decoration: decoration,
    );
  }

  static TextStyle thirdTitle(
    AdaptiveScreen adaptiveScreen, {
    TextDecoration? decoration,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.grey500,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: adaptiveScreen.dp(1.3),
      decoration: decoration,
    );
  }

  static TextStyle content(
    AdaptiveScreen adaptiveScreen, {
    TextDecoration? decoration,
    FontWeight? fontWeight,
    Color? color,
    double? fontSize,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.black100,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? adaptiveScreen.dp(1.5),
      decoration: decoration,
    );
  }
}
