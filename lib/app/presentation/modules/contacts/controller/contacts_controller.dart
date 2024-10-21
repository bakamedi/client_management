import 'package:client_management/app/domain/index_repositories.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../injection_providers.dart';
import 'contacts_state.dart';

final contactsProvider = Provider.state<ContactsController, ContactsState>(
  (_) => ContactsController(
    ContactsState.initialState,
    contactsRepository: Repositories.contactsRep.read(),
  ),
);

class ContactsController extends StateNotifier<ContactsState> {
  final ContactsRepository _contactsRepository;
  ContactsController(
    super.initialState, {
    required ContactsRepository contactsRepository,
  }) : _contactsRepository = contactsRepository {
    init();
  }

  void init() {
    _contactsRepository.getAll();
  }
}
