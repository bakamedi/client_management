import 'package:flutter/material.dart';

abstract class CustomUtilsGW {
  CustomUtilsGW._();

  static void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
