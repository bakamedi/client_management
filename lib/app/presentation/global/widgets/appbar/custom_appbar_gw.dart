import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../text/custom_text_gw.dart';

abstract class CustomAppbarGW {
  CustomAppbarGW._();

  static AppBar simple({required BuildContext context, double? leadingWidth}) {
    final adaptiveScreen = AdaptiveScreen(context);

    return AppBar(
      leadingWidth: leadingWidth ?? adaptiveScreen.bwh(40),
      leading: IconButton(
        icon: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: adaptiveScreen.bwh(1)),
              child: Icon(Icons.arrow_back, color: AppColors.grey500),
            ),
            CustomTextGW.text(
              'Atrás',
              adaptiveScreen: adaptiveScreen,
              fontSize: adaptiveScreen.dp(1.7),
            ),
          ],
        ),
        onPressed: () => context.pop(),
      ),
    );
  }

  static AppBar home({
    required BuildContext context,
    required String url,
    required String names,
    required void Function()? onPressed,
  }) {
    final adaptiveScreen = AdaptiveScreen(context);

    return AppBar(
      toolbarHeight: adaptiveScreen.bhp(7),
      leadingWidth: adaptiveScreen.bwh(100),
      actions: [
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: 50,
            width: 50,
            child:
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(adaptiveScreen.dp(10)),
                    border: Border.all(
                      color: AppColors.grey300.withValues(alpha: 0.3),
                    ),
                  ),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      EvaIcons.personAddOutline,
                      size: adaptiveScreen.dp(2),
                    ),
                  ),
                ).padding(
                  EdgeInsets.only(
                    top: 1,
                    bottom: 10,
                    right: adaptiveScreen.dp(1),
                  ),
                ),
          ),
        ),
      ],
      leading: IconButton(
        icon: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextGW.text(
                  'Bienvenido a CliPro',
                  adaptiveScreen: adaptiveScreen,
                  fontSize: adaptiveScreen.dp(1.7),
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextGW.text(
                  names,
                  adaptiveScreen: adaptiveScreen,
                  fontSize: adaptiveScreen.dp(1.2),
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey400.withValues(alpha: 0.8),
                ),
              ],
            ).padding(EdgeInsets.only(left: adaptiveScreen.bwh(2))),
          ],
        ).padding(EdgeInsets.only(left: adaptiveScreen.bwh(3))),
        onPressed: () {},
      ),
    );
  }
}
