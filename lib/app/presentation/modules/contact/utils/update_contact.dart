import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../global/controllers/loader/loader_gc.dart';
import '../controller/contact_controller.dart';

void updateContact(BuildContext context) async {
  final loaderGC = loaderGlobalProvider.read();

  try {
    loaderGC.showLoader(
      loading: true,
    );
    final contactController = contactProvider.read();
    final result = await contactController.updateContact();

    loaderGC.showLoader(
      loading: false,
    );
    result.when(
      left: (value) {
        print(value);
      },
      right: (value) {
        print(value);
        context.pop();
      },
    );
  } catch (e) {
    print(e);
    loaderGC.showLoader(
      loading: false,
    );
  }
}
