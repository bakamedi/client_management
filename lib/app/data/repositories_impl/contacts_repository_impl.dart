import 'package:client_management/app/domain/typedefs.dart';

import '../../domain/either.dart';
import '../../domain/models/contacts/failure/contacts_failure.dart';
import '../../domain/models/contacts/success/contacts_success.dart';
import '../../domain/responses/contacts/contacts_response.dart';
import '../../domain/respositories/contacts_repository.dart';
import '../data_source/providers/contacts_provider.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final ContactsProvider _contactsProvider;

  ContactsRepositoryImpl({
    required ContactsProvider contactsProvider,
  }) : _contactsProvider = contactsProvider;

  @override
  FutureEither<ContactsFailure, ContactsSuccess> getAll() async {
    final result = await _contactsProvider.getAll();

    return result.when(
      left: (ContactsFailure value) => Either.left(value),
      right: (ContactsResponse token) {
        return const Either.right(
          ContactsSuccess.ok(),
        );
      },
    );
  }
}
