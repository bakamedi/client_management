import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../global/controllers/loader/loader_gc.dart';
import '../../../global/widgets/dialogs/dialogs_gw.dart';
import '../../contacts/utils/get_contacts.dart';
import '../controller/contact_controller.dart';

void createContact(
  BuildContext context,
  ContactController contactController,
) async {
  final loaderGC = loaderGlobalProvider.read();
  loaderGC.showLoader(loading: true);
  final result = await contactController.createContact();
  loaderGC.showLoader(loading: false);

  result.when(
    left: (value) {
      value.when(
        network: () => DialogsGW.simple(
          context,
          type: DialogType.network,
          title: 'Error en conexión',
          content: 'Hubo un error en la conexión',
        ),
        timeOut: () => DialogsGW.simple(
          context,
          type: DialogType.timeout,
          title: 'Error de tiempo de espera',
          content: 'No se pudo conectar con el servidor',
        ),
        unhandledException: () => DialogsGW.simple(
          context,
          type: DialogType.error,
          title: 'Error',
          content: 'No se pudo crear al usuario',
        ),
      );
    },
    right: (value) {
      DialogsGW.simple(
        context,
        title: 'Usuario Creado',
        content: 'El usuario se creo exitosamente',
        onFunctionAfterOk: () {
          getContacts();
          context.pop();
        },
      );
    },
  );
}
