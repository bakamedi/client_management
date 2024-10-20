import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/models/auth/failure/sign_in_failure.dart';
import '../../../global/controllers/loader/loader_gc.dart';
import '../../../global/utils/custom_utils_gu.dart';
import '../../../global/widgets/dialogs/dialogs_gw.dart';
import '../../../router/app_routes/contacts_route.dart';
import '../controller/sign_in_controller.dart';

void login(BuildContext context) async {
  final SignInController signInNewController = signInProvider.read();
  final LoaderGC loaderGC = loaderGlobalProvider.read();
  CustomUtilsGU.unFocusKeyboard();
  loaderGC.showLoader(loading: true);
  final result = await signInNewController.signIn();
  loaderGC.showLoader(loading: false);
  result.when(
    left: (value) {
      if (value == const SignInFailure.network()) {
        DialogsGW.simple(
          context,
          type: DialogType.internet,
          title: 'Error',
          content: 'No hay internet',
        );
      } else if (value == const SignInFailure.notFound()) {
        DialogsGW.simple(
          context,
          type: DialogType.error,
          title: 'Error',
          content: 'Usuario no registrado',
        );
      } else if (value == const SignInFailure.invalidPassword()) {
        DialogsGW.simple(
          context,
          type: DialogType.error,
          title: 'Error',
          content: 'Password incorrecto',
        );
      }
    },
    right: (success) {
      loaderGC.showLoader(loading: false);
      context.pushReplacement(
        ContactsRoute.path,
      );
    },
  );
}
