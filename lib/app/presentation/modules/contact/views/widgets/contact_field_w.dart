import 'package:client_management/app/core/adaptative_screen/adaptive_screen.dart';
import 'package:client_management/app/presentation/extensions/widgets_ext.dart';
import 'package:client_management/app/presentation/global/widgets/inputs/input_text_field_gw.dart';
import 'package:flutter/material.dart';

class ContactInputFieldW extends StatelessWidget {
  const ContactInputFieldW({
    super.key,
    required this.adaptiveScreen,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.controller,
    required this.onChanged,
  });
  final AdaptiveScreen adaptiveScreen;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return InputTextFieldGW(
      labelTxt: label,
      backgroundLabel: hint,
      keyboardType: keyboardType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (_) => onChanged(),
    ).sliverBox.sliverPadding(
      EdgeInsets.symmetric(
        horizontal: adaptiveScreen.bwh(10),
        vertical: adaptiveScreen.bhp(1),
      ),
    );
  }
}
