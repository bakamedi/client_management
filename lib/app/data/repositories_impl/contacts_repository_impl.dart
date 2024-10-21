import 'package:client_management/app/domain/models/contacts/success/contacts_success.dart';
import 'package:client_management/app/domain/typedefs.dart';
import 'package:sembast/sembast.dart';

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

  @override
  FutureEither<ContactsFailure, ContactResponse> update(
    ContactResponse contact,
  ) async {
    final result = await _contactsProvider.update(contact);
    return result.when(
      left: (ContactsFailure value) => Either.left(value),
      right: (ContactResponse contactResp) async {
        final Finder finder = Finder(
          filter: Filter.equals('id', contactResp.id),
        );
        await _storeProvider.updateRecord(
          value: contactResp.toJson(),
          finder: finder,
        );
        return Either.right(
          contactResp,
        );
      },
    );
  }

  @override
  FutureEither<ContactsFailure, ContactsSuccess> delete(
    String id,
  ) async {
    final result = await _contactsProvider.delete(id);
    return result.when(
      left: (ContactsFailure value) => Either.left(value),
      right: (ContactsSuccess contactResp) async {
        final Finder finder = Finder(
          filter: Filter.equals('id', id),
        );
        await _storeProvider.removeRecord(
          finder: finder,
        );
        return Either.right(
          contactResp,
        );
      },
    );
  }
}
