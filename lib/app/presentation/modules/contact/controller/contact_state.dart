import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../../../global/utils/state_gu.dart';
import '../utils/contact_mode.dart';

part 'contact_state.freezed.dart';

@freezed
abstract class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState({
    @Default(false) bool internet,
    @Default(StateGU.internet) StateGU stategu,
    @Default('') String urlCreateProfile,
    TextEditingController? textNamesEditingController,
    TextEditingController? textLastNameEditingController,
    TextEditingController? textPhoneNumberEditingController,
    TextEditingController? textCellPhoneEditingController,
    ContactResponse? contact,
    @Default(ContactMode.create) ContactMode contactMode,
    @Default(false) isFormValid,
    File? fileProfile,
  }) = _ContactState;

  static ContactState get initialState => ContactState(
    contactMode: ContactMode.create,
    textCellPhoneEditingController: TextEditingController(text: ''),
    textLastNameEditingController: TextEditingController(text: ''),
    textNamesEditingController: TextEditingController(text: ''),
    textPhoneNumberEditingController: TextEditingController(text: ''),
    urlCreateProfile: '',
    internet: false,
    isFormValid: false,
  );
}
