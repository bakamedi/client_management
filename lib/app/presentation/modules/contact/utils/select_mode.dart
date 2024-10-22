import 'package:flutter/material.dart';

import '../controller/contact_controller.dart';
import 'contact_mode.dart';
import 'create_contact.dart';
import 'update_contact.dart';

void selectMode(BuildContext context) {
  final contactController = contactProvider.read();

  switch (contactController.contactMode) {
    case ContactMode.create:
      createContact(context, contactController);
    case ContactMode.edit:
      updateContact(context, contactController);
    default:
  }
}
