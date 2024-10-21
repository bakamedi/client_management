import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../utils/contact_mode.dart';

part 'contact_state.freezed.dart';

@freezed
class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState({
    TextEditingController? textNamesEditingController,
    TextEditingController? textLastNameEditingController,
    TextEditingController? textPhoneNumberEditingController,
    TextEditingController? textCellPhoneEditingController,
    ContactResponse? contact,
    @Default(ContactMode.create) ContactMode contactMode,
  }) = _ContactState;

  static ContactState get initialState => ContactState(
        contactMode: ContactMode.create,
        textCellPhoneEditingController: TextEditingController(text: ''),
        textLastNameEditingController: TextEditingController(text: ''),
        textNamesEditingController: TextEditingController(text: ''),
        textPhoneNumberEditingController: TextEditingController(text: ''),
      );
}
