import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../global/utils/state_gu.dart';
import '../../../router/app_routes/contact_route.dart';
import '../../contact/controller/contact_controller.dart';
import '../../contact/utils/contact_mode.dart';

void openCreateContact(BuildContext context) {
  final contactController = contactProvider.read();
  contactController.changeMode(ContactMode.create);
  contactController.changeNoInternet(
    contactController.state.stategu == StateGU.internet,
  );

  context.pushNamed(ContactRoute.path);
}
