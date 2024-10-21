import 'package:client_management/app/domain/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/models/contacts/failure/contacts_failure.dart';
import '../../../../domain/responses/contacts/contacts_response.dart';
import '../../../../domain/respositories/contacts_repository.dart';
import '../../../../injection_providers.dart';
import '../utils/contact_mode.dart';
import 'contact_state.dart';

final contactProvider = Provider.state<ContactController, ContactState>(
  (_) => ContactController(
    ContactState.initialState,
    contactsRepository: Repositories.contactsRep.read(),
  ),
);

class ContactController extends StateNotifier<ContactState> {
  final ContactsRepository _contactsRepository;
  ContactController(
    super.initialState, {
    required ContactsRepository contactsRepository,
  }) : _contactsRepository = contactsRepository {
    initForm();
  }

  TextEditingController? get textNamesEditingController =>
      state.textNamesEditingController;
  TextEditingController? get textLastNameEditingController =>
      state.textLastNameEditingController;
  TextEditingController? get textPhoneNumberEditingController =>
      state.textPhoneNumberEditingController;
  TextEditingController? get textCellPhoneEditingController =>
      state.textCellPhoneEditingController;
  ContactMode get contactMode => state.contactMode;
  String get urlProfile => state.contact?.profileImage ?? '';

  void initForm() {
    onlyUpdate(
      state = state.copyWith(
        textNamesEditingController: TextEditingController(
          text: state.contact?.names,
        ),
        textLastNameEditingController: TextEditingController(
          text: state.contact?.lastName,
        ),
        textPhoneNumberEditingController: TextEditingController(
          text: state.contact?.phoneNumber,
        ),
        textCellPhoneEditingController: TextEditingController(
          text: state.contact?.cellPhoneNumber,
        ),
      ),
    );
  }

  void changeMode(ContactMode mode) {
    onlyUpdate(
      state = state.copyWith(
        contactMode: mode,
      ),
    );
  }

  void setContact(ContactResponse? contact) {
    onlyUpdate(
      state = state.copyWith(
        contact: contact,
      ),
    );
  }

  FutureEither<ContactsFailure, ContactResponse> updateContact() async {
    final updatedContact = state.contact!.copyWith(
      names: textNamesEditingController?.text ?? '',
      lastName: textLastNameEditingController?.text ?? '',
      phoneNumber: textPhoneNumberEditingController?.text ?? '',
      cellPhoneNumber: textCellPhoneEditingController?.text ?? '',
    );

    return await _contactsRepository.update(updatedContact);
  }
}
