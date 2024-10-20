import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../presentation/extensions/widgets_ext.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/loader/loader_gc.dart';

class LoaderGW extends ConsumerWidget {
  final AdaptativeScreen adaptativeScreen;

  const LoaderGW({
    super.key,
    required this.adaptativeScreen,
  });

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
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        color: AppColors.black100.withOpacity(0.4),
                      ),
                    ),
                    LoadingAnimationWidget.inkDrop(
                      color: AppColors.white,
                      size: adaptativeScreen.dp(3),
                    ).center,
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(
            width: 0,
            height: 0,
          );
  }
}
