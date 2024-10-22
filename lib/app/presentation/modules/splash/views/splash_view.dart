// ignore_for_file: library_private_types_in_public_api

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../extensions/widgets_ext.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../global/controllers/session/session_gc.dart';
import '../controller/splash_controller.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    _initializeSession(); // Método separado para la operación asíncrona
  }

  Future<void> _initializeSession() async {
    final SessionGC sessionGC = sessionGP.read();
    await sessionGC.init();
  }

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(context);

    ref.listen(
      splashProvider,
      callback: (notifier) {
        final controller = notifier.state;
        if (controller.isJwtToken != null && context.mounted) {
          context.pushReplacementNamed(
            controller.routeName,
          );
        }
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            EvaIcons.briefcase,
            size: adaptativeScreen.dp(6),
          ),
          LoadingAnimationWidget.progressiveDots(
            color: AppColors.black100,
            size: adaptativeScreen.dp(5),
          )
        ],
      ).center,
    );
  }
}
