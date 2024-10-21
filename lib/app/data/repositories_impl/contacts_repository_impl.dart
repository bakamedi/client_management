import 'package:client_management/app/domain/typedefs.dart';

import '../../domain/either.dart';
import '../../domain/models/contacts/failure/contacts_failure.dart';
import '../../domain/responses/contacts/contacts_response.dart';
import '../../domain/respositories/contacts_repository.dart';
import '../data_source/providers/contacts_provider.dart';
import '../data_source/providers/store_provider.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final ContactsProvider _contactsProvider;
  final StoreProvider _storeProvider;

  ContactsRepositoryImpl({
    required ContactsProvider contactsProvider,
    required StoreProvider storeProvider,
  })  : _contactsProvider = contactsProvider,
        _storeProvider = storeProvider;

  @override
  FutureEither<ContactsFailure, List<ContactResponse>> getAll() async {
    final result = await _contactsProvider.getAll();

    return result.when(
      left: (ContactsFailure value) => Either.left(value),
      right: (ContactsResponse contactsResponse) async {
        if (contactsResponse.data.isNotEmpty) {
          for (final contact in contactsResponse.data) {
            await _storeProvider.createRecord(contact.toJson());
          }
        }

        return Either.right(
          contactsResponse.data,
        );
      },
    );
  }
}
