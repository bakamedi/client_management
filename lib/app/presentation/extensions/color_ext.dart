import 'package:flutter/material.dart';

extension ColorExt on Color {
  String get colorToHex {
    return '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
