import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../extensions/widgets_ext.dart';
import '../../utils/custom_utils_gu.dart';
import '../text/custom_text_gw.dart';

abstract class ScaffoldSimpleBodyGW {
  static Widget simple({
    PreferredSizeWidget? appBar,
    required AdaptiveScreen adaptiveScreen,
    required String title,
    required Widget body,
    double? top,
  }) {
    return GestureDetector(
      onTap: () => CustomUtilsGU.unFocusKeyboard(),
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextGW.text(
                  title,
                  adaptiveScreen: adaptiveScreen,
                  padding: EdgeInsets.only(
                    top: adaptiveScreen.bhp(top ?? 25),
                    bottom: adaptiveScreen.bhp(2),
                  ),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ).flexible,
                body,
              ],
            ).padding(
              EdgeInsets.only(
                left: adaptiveScreen.bwh(10),
                right: adaptiveScreen.bwh(10),
              ),
            ),
      ),
    );
  }

  static Widget home({
    PreferredSizeWidget? appBar,
    required AdaptiveScreen adaptiveScreen,
    required Widget body,
    Widget? floatingActionButton,
    double? top,
  }) {
    return GestureDetector(
      onTap: () => CustomUtilsGU.unFocusKeyboard(),
      child: Scaffold(
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
