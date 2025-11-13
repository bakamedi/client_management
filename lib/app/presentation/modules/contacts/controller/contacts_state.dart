import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../../../global/utils/state_gu.dart';

part 'contacts_state.freezed.dart';

@freezed
abstract class ContactsState with _$ContactsState {
  const ContactsState._();

  const factory ContactsState({
    @Default(StateGU.internet) StateGU stategu,
    @Default([]) List<ContactResponse> contacts,
  }) = _ContactsState;

  static ContactsState get initialState =>
      const ContactsState(contacts: [], stategu: StateGU.fetching);
}
