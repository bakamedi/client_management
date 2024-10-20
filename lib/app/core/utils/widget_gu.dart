import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class WidgetGU {
  WidgetGU._();

  static Widget? showEyeIcon({
    required bool show,
  }) {
    return show ? const Icon(EvaIcons.eye) : const Icon(EvaIcons.eyeOff);
  }
}
