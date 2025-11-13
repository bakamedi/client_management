import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../core/theme/app_colors.dart';

/// clase Global para el [TextFormField] con el diseño
/// requerido por FashionPark
/// si falta algun parametro que se desee utilizar en el [TextFormField]
/// se lo puede añadir como un [final] si es obligatorio el campo
/// el simbolo [?] despues del tipo de dato a utilizar
///
/// Ejemplo1: final String? datoNoObligatorio
/// Ejemplo2: final String datoObligatorio
final radius = BorderRadius.circular(10.0);

///
class InputTextFieldGW extends StatelessWidget {
  const InputTextFieldGW({
    super.key,
    this.autofocus = false,
    this.prefixInput,
    this.suffixInput,
    this.textDirection,
    this.autovalidateMode,
    this.focusNode,
    this.obscureText = false,
    this.maxLength = 100,
    this.obscuringCharacter = '•',
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    required this.backgroundLabel,
    required this.onChanged,
    this.onTap,
    this.validator,
    this.margin,
    this.padding,
    this.enabled,
    this.onTapOutside,
    this.initialValue,
    required this.labelTxt,
  });
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool autofocus;
  final bool? enabled;
  final Widget? prefixInput;
  final Widget? suffixInput;
  final TextDirection? textDirection;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String backgroundLabel;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final bool readOnly;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onFieldSubmitted;
  final void Function(String) onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String labelTxt;

  @override
  Widget build(BuildContext context) {
    final adaptiveScreen = AdaptiveScreen(context);

    return Container(
      margin: margin,
      padding: padding,
      decoration: _decorationTextFormField(),
      child: TextFormField(
        onChanged: (value) {
          onChanged(value);
        },
        onFieldSubmitted: (value) {
          try {
            onFieldSubmitted!();
          } catch (_) {}
        },
        onTap: () {
          try {
            onTap!();
          } catch (_) {}
        },
        initialValue: controller == null ? initialValue : null,
        enabled: enabled,
        readOnly: readOnly,
        obscuringCharacter: obscuringCharacter,
        textAlign: textAlign,
        autofocus: autofocus,
        textDirection: textDirection,
        autovalidateMode: autovalidateMode,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: maxLines,
        obscureText: obscureText!,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
        decoration: _simpleInput(
          context,
          adaptiveScreen,
          labelTxt,
          backgroundLabel,
          prefix: prefixInput,
          suffix: suffixInput,
        ),
        textInputAction: textInputAction,
        validator: (value) {
          try {
            return validator!(value);
          } catch (_) {}
          return null;
        },
      ),
    );
  }
}

/// Diseño global para el [Container] de afuera del [TextFormField]
/// En donde se da el color blanco de fondo y los bordes redondeados
/// Con la sombra de atras
BoxDecoration _decorationTextFormField() {
  return BoxDecoration(borderRadius: radius);
}

/// Diseño global para el [TextFormField]
/// En donde se da el color con esta en [Focus] y un tamaño
/// dependiendo de la altura de la pantalla
InputDecoration _simpleInput(
  BuildContext context,
  AdaptiveScreen adaptiveScreen,
  String labelTxt,
  String hintText, {
  Widget? suffix,
  Widget? prefix,
}) {
  return InputDecoration(
    labelText: labelTxt,
    suffixIcon: Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.height * 0.02,
      ),
      child: suffix,
    ),
    prefixIcon: prefix,
    counterText: '',
    isDense: true,
    filled: true,
    fillColor: AppColors.grey100.withValues(alpha: .4),
    hintText: hintText,
    labelStyle: TextStyle(
      fontFamily: 'Inter',
      fontSize: adaptiveScreen.dp(1.5),
      color: AppColors.grey500,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Inter',
      fontSize: adaptiveScreen.dp(1.5),
      color: AppColors.grey300,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
    ),
    suffixIconConstraints: const BoxConstraints(minWidth: 2, minHeight: 2),
    enabledBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: AppColors.grey100, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: AppColors.primary, width: 2.0),
    ),
  );
}
