// ignore_for_file: library_private_types_in_public_api

import 'package:client_management/app/presentation/modules/splash/views/widgets/animated_icon_row_w.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../extensions/widgets_ext.dart';
import '../../../../core/adaptative_screen/adaptive_screen.dart';
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
    final adaptiveScreen = AdaptiveScreen(context);

    ref.listen(
      splashProvider,
      callback: (notifier) {
        final controller = notifier.state;
        if (controller.isJwtToken != null && context.mounted) {
          context.pushReplacementNamed(controller.routeName);
        }
      },
    );

    return Scaffold(
      backgroundColor: AppColors.primary.withValues(
        alpha: 0.8,
      ), // fondo con color corporativo o degradado
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(adaptiveScreen.dp(4)),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .15),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: adaptiveScreen.dp(2),
                    offset: Offset(0, adaptiveScreen.dp(1)),
                  ),
                ],
              ),
              child: Icon(
                EvaIcons.briefcase,
                color: Colors.white,
                size: adaptiveScreen.dp(12),
              ),
            ),

            adaptiveScreen.hp(4).h,

            AnimatedIconsRow(adaptiveScreen: adaptiveScreen),

            adaptiveScreen.hp(3).h,

            LoadingAnimationWidget.progressiveDots(
              color: Colors.white,
              size: adaptiveScreen.dp(6),
            ),

            adaptiveScreen.hp(2).h,

            // Texto opcional tipo “Cargando...”
            Text(
              "Cargando...",
              style: TextStyle(
                color: Colors.white.withValues(alpha: .9),
                fontSize: adaptiveScreen.dp(2.2),
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
