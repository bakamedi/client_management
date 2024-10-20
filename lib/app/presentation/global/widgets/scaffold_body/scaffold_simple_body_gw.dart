import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../extensions/widgets_ext.dart';
import '../../utils/custom_utils_gw.dart';
import '../text/custom_text_gw.dart';

class ScaffoldSimpleBodyGW extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;
  final PreferredSizeWidget? appBar;
  final String title;
  final Widget body;

  const ScaffoldSimpleBodyGW({
    super.key,
    this.appBar,
    required this.adaptativeScreen,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomUtilsGW.unFocusKeyboard(),
      child: Scaffold(
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextGW.text(
              title,
              adaptativeScreen: adaptativeScreen,
              padding: EdgeInsets.only(
                top: adaptativeScreen.bhp(25),
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
}
