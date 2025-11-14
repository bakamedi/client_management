import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:client_management/app/presentation/modules/contacts/utils/open_create_contact.dart';

class CreateContactBtnW extends StatelessWidget {
  const CreateContactBtnW({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => openCreateContact(context),
      child: const Icon(EvaIcons.plus),
    );
  }
}
