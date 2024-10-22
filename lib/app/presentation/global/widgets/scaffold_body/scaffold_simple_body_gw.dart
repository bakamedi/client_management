import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../extensions/widgets_ext.dart';
import '../../utils/custom_utils_gu.dart';
import '../text/custom_text_gw.dart';

abstract class ScaffoldSimpleBodyGW {
  static Widget simple({
    PreferredSizeWidget? appBar,
    required AdaptativeScreen adaptativeScreen,
    required String title,
    required Widget body,
    double? top,
  }) {
    return GestureDetector(
      onTap: () => CustomUtilsGU.unFocusKeyboard(),
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextGW.text(
              title,
              adaptativeScreen: adaptativeScreen,
              padding: EdgeInsets.only(
                top: adaptativeScreen.bhp(top ?? 25),
                bottom: adaptativeScreen.bhp(2),
              ),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ).flexible,
            body
          ],
        ).padding(
          EdgeInsets.only(
            left: adaptativeScreen.bwh(10),
            right: adaptativeScreen.bwh(10),
          ),
        ),
      ),
    );
  }

  static Widget home({
    PreferredSizeWidget? appBar,
    required AdaptativeScreen adaptativeScreen,
    required Widget body,
    double? top,
  }) {
    return GestureDetector(
      onTap: () => CustomUtilsGU.unFocusKeyboard(),
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
