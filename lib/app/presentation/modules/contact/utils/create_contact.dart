import 'package:client_management/app/domain/either.dart';
import 'package:client_management/app/domain/models/contacts/failure/contacts_failure.dart';
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
  if (contactController.fileProfile == null) {
    await crateAfterUploadImage(
      context: context,
      contactController: contactController,
      loaderGC: loaderGC,
    );
  } else {
    final uploadResult = await contactController.uploadImageContact();

    uploadResult.when(
      left: (value) {
        loaderGC.showLoader(loading: false);
      },
      right: (urlProfile) async {
        await crateAfterUploadImage(
          context: context,
          contactController: contactController,
          loaderGC: loaderGC,
          urlProfile: urlProfile,
        );
      },
    );
  }
}

Future<void> crateAfterUploadImage({
  required BuildContext context,
  required ContactController contactController,
  required LoaderGC loaderGC,
  String urlProfile = '',
}) async {
  contactController.changeUrlCreateProfile(urlProfile);
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
      loaderGC.showLoader(loading: false);

      DialogsGW.simple(
        context,
        title: 'Usuario Creado',
        type: DialogType.success,
        content: 'El usuario se creó exitosamente',
        onFunctionAfterOk: () {
          getContacts();
          context.pop();
        },
      );
    },
  );
}
