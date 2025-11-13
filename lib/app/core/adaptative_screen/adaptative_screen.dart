import 'dart:math' as math;
import 'package:flutter/material.dart';

class AdaptativeScreen {
  AdaptativeScreen(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final size = mediaQueryData.size;

    width = size.width;
    height = size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
    diagonal = math.sqrt(math.pow(width, 2) + math.pow(height, 2));

    final safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    final safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - safeAreaHorizontal) / 100;
    safeBlockVertical = (height - safeAreaVertical) / 100;
  }
  late final double width;
  late final double height;
  late final double diagonal;
  late final double blockSizeHorizontal;
  late final double blockSizeVertical;
  late final double safeBlockHorizontal;
  late final double safeBlockVertical;

  static AdaptativeScreen of(BuildContext context) => AdaptativeScreen(context);

  double wp(double percent) => width * percent / 100;
  double hp(double percent) => height * percent / 100;
  double dp(double percent) => diagonal * percent / 100;

  double bwh(double percent) => blockSizeHorizontal * percent;
  double bhp(double percent) => blockSizeVertical * percent;

  double sbwh(double percent) => safeBlockHorizontal * percent;
  double sbhp(double percent) => safeBlockVertical * percent;
}
