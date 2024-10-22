import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../../../router/app_routes/contact_route.dart';
import '../../contact/controller/contact_controller.dart';
import '../../contact/utils/contact_mode.dart';

void openEditContact(
  BuildContext context,
  ContactResponse contact,
) {
  final contactController = contactProvider.read();
  contactController.setContact(contact);
  contactController.initForm();
  contactController.changeMode(ContactMode.edit);

  context.pushNamed(ContactRoute.path);
}
