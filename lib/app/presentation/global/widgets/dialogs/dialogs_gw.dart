import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';

import '../../../../core/theme/app_colors.dart';
import '../btns/custom_btn_gw.dart';
import '../text/custom_text_gw.dart';
import '../../../extensions/widgets_ext.dart';

const shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      20,
    ),
  ),
);

/// Tipos de dialogos
enum DialogType {
  success,
  error,
  info,
  custom,
  none,
  internet,
  timeout,
  network
}

/// clase [Dialogs] para los dialogos personalizados
abstract class DialogsGW {
  DialogsGW._();

  /// Dialogo Simple que aparece con una sola opcion que desaparece
  static Future<void> simple(
    BuildContext context, {
    DialogType? type = DialogType.error,
    required String title,
    required String content,
    TextStyle? textStyle,
    Decoration? decorationContent,
    IconData? iconData,
    Function()? onFunctionAfterOk,
  }) {
    final adaptiveScreen = AdaptiveScreen(
      context,
    );

    return showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, _) {
          if (value) return;
        },
        child: AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          shape: shape,
          insetPadding: const EdgeInsets.all(10),
          title: Column(
            children: [
              _iconDialogType(
                adaptiveScreen,
                type ?? DialogType.success,
                iconData,
              ),
              CustomTextGW.text(
                title,
                textAlign: TextAlign.center,
                adaptiveScreen: adaptiveScreen,
              ),
            ],
          ).center,
          content: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: decorationContent,
                padding: const EdgeInsets.all(
                  2,
                ),
                child: CustomTextGW.text(
                  content,
                  textAlign: TextAlign.center,
                  adaptiveScreen: adaptiveScreen,
                ),
              ).expanded,
            ],
          ),
          actions: <Widget>[
            CustomBtnGW.primary(
              label: 'ok',
              adaptiveScreen: adaptiveScreen,
              fontSize: adaptiveScreen.dp(1.1),
              margin: EdgeInsets.symmetric(
                horizontal: adaptiveScreen.bwh(10),
                vertical: adaptiveScreen.bhp(1),
              ),
              onPressed: () {
                Navigator.pop(context);
                try {
                  onFunctionAfterOk!();
                } catch (_) {}
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Icono dependiendo de la clase [DialogType]
  static Widget _iconDialogType(
    AdaptiveScreen adaptiveScreen,
    DialogType type,
    IconData? iconData,
  ) {
    switch (type) {
      case DialogType.success:
        return _icon(
          adaptiveScreen,
          EvaIcons.checkmarkCircle2Outline,
        );
      case DialogType.info:
        return _icon(
          adaptiveScreen,
          EvaIcons.infoOutline,
        );
      case DialogType.internet:
        return _icon(
          adaptiveScreen,
          EvaIcons.wifiOffOutline,
        );
      case DialogType.error:
        return _icon(
          adaptiveScreen,
          EvaIcons.closeCircleOutline,
        );
      case DialogType.timeout:
        return _icon(
          adaptiveScreen,
          EvaIcons.clockOutline,
        );
      case DialogType.none:
        return const SizedBox(
          width: 0,
          height: 0,
        );
      case DialogType.custom:
        return _icon(
          adaptiveScreen,
          iconData,
        );
      default:
        return _icon(
          adaptiveScreen,
          iconData,
        );
    }
  }

  /// Icono del dialogo
  static Widget _icon(
    AdaptiveScreen adaptiveScreen,
    IconData? iconData,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Icon(
        iconData,
        size: adaptiveScreen.dp(5),
        color: AppColors.black100,
      ),
    );
  }
}
