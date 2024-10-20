import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import 'contacts_state.dart';

final contactsProvider = Provider.state<ContactsController, ContactsState>(
  (_) => ContactsController(
    ContactsState.initialState,
  ),
);

class ContactsController extends StateNotifier<ContactsState> {
  ContactsController(
    super.initialState,
  );
}
