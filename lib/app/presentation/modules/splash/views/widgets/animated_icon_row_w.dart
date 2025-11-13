import 'package:client_management/app/core/adaptative_screen/adaptive_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AnimatedIconsRow extends StatefulWidget {
  const AnimatedIconsRow({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  State<AnimatedIconsRow> createState() => _AnimatedIconsRowState();
}

class _AnimatedIconsRowState extends State<AnimatedIconsRow>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;
  final icons = [
    EvaIcons.activity,
    EvaIcons.flip,
    EvaIcons.peopleOutline,
    EvaIcons.checkmarkCircle,
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      icons.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );

    _animations = _controllers
        .map((c) => CurvedAnimation(parent: c, curve: Curves.easeOutBack))
        .toList();

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adaptiveScreen = widget.adaptiveScreen;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(icons.length, (i) {
        return ScaleTransition(
          scale: _animations[i],
          child: FadeTransition(
            opacity: _animations[i],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: adaptiveScreen.dp(1)),
              child: Icon(
                icons[i],
                color: Colors.white70,
                size: adaptiveScreen.dp(4.5),
              ),
            ),
          ),
        );
      }),
    );
  }
}
