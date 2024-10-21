import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../domain/responses/contacts/contacts_response.dart';
import '../../../../domain/respositories/contacts_repository.dart';
import '../../../../injection_providers.dart';
import '../../../global/utils/state_gu.dart';
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

  StateGU get stategu => state.stategu;
  List<ContactResponse> get contacts => state.contacts;

  void init() async {
    final result = await _contactsRepository.getAll();
    result.when(
      left: (value) {
        value.when(
          network: () => _changeStateGU(
            StateGU.internet,
          ),
          timeOut: () => _changeStateGU(
            StateGU.timeout,
          ),
          unhandledException: () => _changeStateGU(
            StateGU.error,
          ),
        );
      },
      right: (value) {
        onlyUpdate(
          state = state.copyWith(contacts: value),
        );
        _changeStateGU(
          StateGU.success,
        );
      },
    );
  }

  void _changeStateGU(StateGU stateGU) {
    onlyUpdate(
      state = state.copyWith(
        stategu: stateGU,
      ),
    );
  }
}
