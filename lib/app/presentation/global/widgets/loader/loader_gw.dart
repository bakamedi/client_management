import 'dart:ui';
import 'package:client_management/app/presentation/modules/splash/views/widgets/animated_icon_row_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/loader/loader_gc.dart';

class LoaderGW extends ConsumerWidget {
  const LoaderGW({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final loaderGC = ref.watch(loaderGlobalProvider);

    return loaderGC.loading
        ? PopScope(
            canPop: false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                color: AppColors.transparent,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: AppColors.black100.withValues(alpha: .4),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedIconsRow(adaptiveScreen: adaptiveScreen),
                        LoadingAnimationWidget.progressiveDots(
                          color: Colors.white70,
                          size: adaptiveScreen.dp(3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(width: 0, height: 0);
  }
}
