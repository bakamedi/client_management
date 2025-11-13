import 'package:client_management/app/domain/either.dart';
import 'package:client_management/app/domain/models/contacts/failure/contacts_failure.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../global/controllers/loader/loader_gc.dart';
import '../../../global/widgets/dialogs/dialogs_gw.dart';
import '../../contacts/utils/get_contacts.dart';
import '../controller/contact_controller.dart';

void updateUploadImage(
  BuildContext context,
  ContactController contactController,
) async {
  final loaderGC = loaderGlobalProvider.read();
  loaderGC.showLoader(loading: true);
  if (contactController.fileProfile == null) {
    await updateAfterUploadImage(
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
        await updateAfterUploadImage(
          context: context,
          contactController: contactController,
          loaderGC: loaderGC,
          urlProfile: urlProfile,
        );
      },
    );
  }
}

Future<void> updateAfterUploadImage({
  required BuildContext context,
  required ContactController contactController,
  required LoaderGC loaderGC,
  String urlProfile = '',
}) async {
  final loaderGC = loaderGlobalProvider.read();

  try {
    loaderGC.showLoader(loading: true);
    final result = await contactController.updateContact(
      urlCreateProfile: urlProfile,
    );
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
            content: 'No se pudo actualizar el usuario',
          ),
        );
      },
      right: (value) {
        DialogsGW.simple(
          context,
          type: DialogType.success,
          title: 'Acutalizado',
          content: 'El usuario se actualizo con exito',
          onFunctionAfterOk: () {
            getContacts();
            context.pop();
          },
        );
      },
    );
  } catch (_) {
    loaderGC.showLoader(loading: false);
  }
}
