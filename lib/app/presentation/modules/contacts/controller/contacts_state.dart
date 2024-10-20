import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';

part 'contacts_state.freezed.dart';

@freezed
class ContactsState with _$ContactsState {
  const ContactsState._();

  const factory ContactsState({
    @Default([]) List<ContactResponse> contacts,
  }) = _ContactsState;

  static ContactsState get initialState => const ContactsState(
        contacts: [],
      );
}
