import '../controller/contacts_controller.dart';

void getContacts() {
  final contactsController = contactsProvider.read();

  contactsController.init(retry: true);
}
