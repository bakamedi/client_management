import 'package:client_management/app/domain/either.dart';
import 'package:client_management/app/domain/models/auth/failure/sign_in_failure.dart';
import 'package:client_management/app/presentation/global/widgets/dialogs/dialogs_gw.dart';
import 'package:client_management/app/presentation/router/app_routes/contacts_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../global/controllers/loader/loader_gc.dart';
import '../controller/sign_up_controller.dart';

void register(BuildContext context) async {
  final LoaderGC loaderGC = loaderGlobalProvider.read();
  final SignUpController signUpController = signUpProvider.read();

  loaderGC.showLoader(loading: true);

  final result = await signUpController.signUp();

  loaderGC.showLoader(loading: false);

  result.when(
    left: (value) {
      value.when(
        network: () => DialogsGW.simple(
          context,
          title: 'Error de conexión',
          type: DialogType.network,
          content:
              'No pudimos conectar con el servidor. Revisa tu conexión e inténtalo nuevamente.',
        ),
        timeOut: () => DialogsGW.simple(
          context,
          title: 'Tiempo agotado',
          type: DialogType.timeout,
          content:
              'La solicitud tardó demasiado. Por favor vuelve a intentarlo en unos segundos.',
        ),
        notFound: () => DialogsGW.simple(
          context,
          title: 'Usuario no encontrado',
          type: DialogType.custom,
          iconData: EvaIcons.personDeleteOutline,
          content: 'No hemos encontrado información asociada a este usuario.',
        ),
        invalidPassword: () => DialogsGW.simple(
          context,
          title: 'Contraseña incorrecta',
          type: DialogType.custom,
          iconData: EvaIcons.alertTriangleOutline,
          content:
              'La contraseña ingresada no es válida. Por favor inténtalo de nuevo.',
        ),
        error: () => DialogsGW.simple(
          context,
          title: 'Error inesperado',
          type: DialogType.error,
          content: 'Algo salió mal. Por favor intenta nuevamente.',
        ),
        unhandledException: () => DialogsGW.simple(
          context,
          title: 'Error inesperado',
          type: DialogType.error,
          content:
              'Se produjo un problema interno. Estamos trabajando para solucionarlo.',
        ),
        internetConnection: () => DialogsGW.simple(
          context,
          title: 'Sin conexión a Internet',
          type: DialogType.internet,
          content: 'Verifica tu conexión y vuelve a intentarlo.',
        ),
        emailAlreadyExists: () => DialogsGW.simple(
          context,
          title: 'El usuario ya existe',
          type: DialogType.error,
          content:
              'El correo electrónico que intentas registrar ya está asociado a otra cuenta.',
        ),
      );
    },
    right: (value) {
      context.pushReplacement(ContactsRoute.path);
    },
  );
}
