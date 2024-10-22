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

  loaderGC.showLoader(
    loading: true,
  );

  final result = await signUpController.signUp();

  loaderGC.showLoader(
    loading: false,
  );

  result.when(
    left: (value) {
      value.when(
        network: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.network,
          content: '',
        ),
        timeOut: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.timeout,
          content: '',
        ),
        notFound: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.custom,
          iconData: EvaIcons.personDeleteOutline,
          content: '',
        ),
        invalidPassword: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.custom,
          iconData: EvaIcons.alertTriangleOutline,
          content: '',
        ),
        error: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.error,
          content: '',
        ),
        unhandledException: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.error,
          content: '',
        ),
        internetConnection: () => DialogsGW.simple(
          context,
          title: '',
          type: DialogType.internet,
          content: '',
        ),
      );
    },
    right: (value) {
      context.pushReplacement(ContactsRoute.path);
    },
  );
}
