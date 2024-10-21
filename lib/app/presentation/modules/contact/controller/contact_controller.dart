import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../utils/contact_mode.dart';
import 'contact_state.dart';

final contactProvider = Provider.state<ContactController, ContactState>(
  (_) => ContactController(
    ContactState.initialState,
  ),
);

class ContactController extends StateNotifier<ContactState> {
  ContactController(super.initialState) {
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
}
