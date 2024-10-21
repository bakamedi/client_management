import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../text/custom_text_gw.dart';

abstract class CustomAppbarGW {
  CustomAppbarGW._();

  static AppBar simple({
    required BuildContext context,
    double? leadingWidth,
  }) {
    final adaptativeScreen = AdaptativeScreen(context);

    return AppBar(
      leadingWidth: leadingWidth ?? adaptativeScreen.bwh(40),
      leading: IconButton(
        icon: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: adaptativeScreen.bwh(1),
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.grey500,
              ),
            ),
            CustomTextGW.text(
              'Atrás',
              adaptativeScreen: adaptativeScreen,
              fontSize: adaptativeScreen.dp(1.7),
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
    required int contactsLength,
    required void Function()? onPressed,
  }) {
    final adaptativeScreen = AdaptativeScreen(context);

    return AppBar(
      toolbarHeight: adaptativeScreen.bhp(7),
      leadingWidth: adaptativeScreen.bwh(100),
      actions: [
        GestureDetector(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                adaptativeScreen.dp(10),
              ),
              border: Border.all(
                color: AppColors.grey300.withOpacity(0.3),
              ),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                EvaIcons.personAddOutline,
                size: adaptativeScreen.dp(2),
              ),
            ),
          ).padding(
            EdgeInsets.only(right: adaptativeScreen.dp(1)),
          ),
        ),
      ],
      leading: IconButton(
        icon: Row(
          children: [
            ExtendedImage.network(
              url,
              width: adaptativeScreen.bwh(10),
              height: adaptativeScreen.bwh(10),
              fit: BoxFit.cover,
              shape: BoxShape.circle,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextGW.text(
                  names,
                  adaptativeScreen: adaptativeScreen,
                  fontSize: adaptativeScreen.dp(1.7),
                  fontWeight: FontWeight.bold,
                ),
                CustomTextGW.text(
                  '$contactsLength contactos',
                  adaptativeScreen: adaptativeScreen,
                  fontSize: adaptativeScreen.dp(1.4),
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey300,
                ),
              ],
            ).padding(
              EdgeInsets.only(
                left: adaptativeScreen.bwh(2),
              ),
            ),
          ],
        ).padding(
          EdgeInsets.only(
            left: adaptativeScreen.bwh(3),
          ),
        ),
        onPressed: () => context.pop(),
      ),
    );
  }
}
