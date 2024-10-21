import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const int millisecondsDelay = 1000;
    const double radius = 16;
    final adaptativeScreen = AdaptativeScreen(
      context,
    );
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeShimmer(
              height: adaptativeScreen.bhp(10),
              width: adaptativeScreen.bwh(80),
              fadeTheme: FadeTheme.light,
              baseColor: AppColors.shimmerOneGreyColor,
              highlightColor: AppColors.shimmerTwoGreyColor,
              radius: radius,
              millisecondsDelay: millisecondsDelay,
              //delayInMilliSeconds: Duration(milliseconds: 500),
            ),
            const SizedBox(
              height: 8,
            ),
            FadeShimmer(
              height: adaptativeScreen.bhp(5),
              width: adaptativeScreen.bwh(80),
              fadeTheme: FadeTheme.light,
              baseColor: AppColors.shimmerOneGreyColor,
              highlightColor: AppColors.shimmerTwoGreyColor,
              radius: 16, millisecondsDelay: 500,
              //borderRadius: const BorderRadius.all(Radius.circular(16)),
              //delayInMilliSeconds: Duration(milliseconds: 500),
            ),
            const SizedBox(
              height: 8,
            ),
            FadeShimmer(
              height: adaptativeScreen.bhp(5),
              width: adaptativeScreen.bwh(80),
              fadeTheme: FadeTheme.light,
              baseColor: AppColors.shimmerOneGreyColor,
              highlightColor: AppColors.shimmerTwoGreyColor,
              radius: radius,
              millisecondsDelay: millisecondsDelay,
            ),
            const SizedBox(
              height: 40,
            ),
            FadeShimmer(
              height: adaptativeScreen.bhp(5),
              width: adaptativeScreen.bwh(80),
              fadeTheme: FadeTheme.light,
              baseColor: AppColors.shimmerOneGreyColor,
              highlightColor: AppColors.shimmerTwoGreyColor,
              radius: radius,
              millisecondsDelay: millisecondsDelay,
            ),
            const SizedBox(
              height: 10,
            ),
            FadeShimmer(
              height: adaptativeScreen.bhp(5),
              width: adaptativeScreen.bwh(80),
              fadeTheme: FadeTheme.light,
              baseColor: AppColors.shimmerOneGreyColor,
              highlightColor: AppColors.shimmerTwoGreyColor,
              radius: radius,
              millisecondsDelay: millisecondsDelay,
            ),
          ],
        ),
      ).center,
    );
  }
}
