import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';

abstract class CustomTextGW {
  CustomTextGW._();

  static Widget text(
    String data, {
    required AdaptativeScreen adaptativeScreen,
    double fontSize = 0,
    Color? color,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    int? maxLines,
  }) {
    final fontSizeLocal = fontSize == 0 ? adaptativeScreen.dp(1.7) : fontSize;
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: true,
        style: TextStyle(
          color: color,
          fontFamily: 'Inter',
          fontWeight: fontWeight,
          fontSize: fontSizeLocal,
          fontStyle: fontStyle,
          wordSpacing: 0.5,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  static Widget richText({
    required AdaptativeScreen adaptativeScreen,
    required String firstText,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextStyle? firstStyle,
    List<InlineSpan>? children,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    final fontSizeLocal = fontSize ?? adaptativeScreen.dp(1.7);
    return Container(
      margin: margin,
      padding: padding,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            fontFamily: 'Inter',
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSizeLocal,
            fontStyle: fontStyle,
            wordSpacing: 0.5,
            letterSpacing: 0.5,
          ),
          children: children,
        ),
      ),
    );
  }
}
