import 'package:flutter/material.dart';

import '../../../core/adaptative_screen/adaptative_screen.dart';
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

  static TextStyle mainTitle(AdaptativeScreen adaptativeScreen) {
    return _baseTextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w800,
      fontSize: adaptativeScreen.dp(2.5),
    );
  }

  static TextStyle title(AdaptativeScreen adaptativeScreen) {
    return _baseTextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w600,
      fontSize: adaptativeScreen.dp(2),
    );
  }

  static TextStyle subtitle(
    AdaptativeScreen adaptativeScreen, {
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.black100,
      fontWeight: FontWeight.w700,
      fontSize: adaptativeScreen.dp(1.8),
      decoration: decoration,
    );
  }

  static TextStyle thirdTitle(
    AdaptativeScreen adaptativeScreen, {
    TextDecoration? decoration,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.grey500,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: adaptativeScreen.dp(1.3),
      decoration: decoration,
    );
  }

  static TextStyle content(
    AdaptativeScreen adaptativeScreen, {
    TextDecoration? decoration,
    FontWeight? fontWeight,
    Color? color,
    double? fontSize,
  }) {
    return _baseTextStyle(
      color: color ?? AppColors.black100,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? adaptativeScreen.dp(1.5),
      decoration: decoration,
    );
  }
}
