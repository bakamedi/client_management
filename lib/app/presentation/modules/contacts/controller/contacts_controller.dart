import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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

class ContactsController extends StateNotifier<ContactsState>
    with WidgetsBindingObserver {
  final ContactsRepository _contactsRepository;
  late StreamSubscription<InternetStatus> listener;

  ContactsController(
    super.initialState, {
    required ContactsRepository contactsRepository,
  }) : _contactsRepository = contactsRepository {
    init();

    listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          onlyUpdate(
            state = state.copyWith(
              stategu: StateGU.success,
            ),
          );
          break;
        case InternetStatus.disconnected:
          onlyUpdate(
            state = state.copyWith(
              stategu: StateGU.internet,
            ),
          );
          break;
      }
    });
  }

  StateGU get stategu => state.stategu;
  List<ContactResponse> get contacts => state.contacts;

  void init({bool retry = false}) async {
    if (retry) {
      onlyUpdate(
        state = state.copyWith(
          stategu: StateGU.fetching,
        ),
      );
    }
    final result = await _contactsRepository.getAll();
    result.when(
      left: (value) {
        value.when(
          network: () async {
            final result = await _contactsRepository.localGetAll();
            result.when(
              left: (_) => _changeStateGU(
                StateGU.error,
              ),
              right: (value) {
                onlyUpdate(
                  state = state.copyWith(
                    contacts: value,
                    stategu: StateGU.internet,
                  ),
                );
              },
            );
          },
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

  @override
  FutureOr<void> dispose() {
    listener.cancel();
    return super.dispose();
  }
}
