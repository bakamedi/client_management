import 'package:flutter/material.dart';

abstract class CustomUtilsGU {
  CustomUtilsGU._();

  static void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
