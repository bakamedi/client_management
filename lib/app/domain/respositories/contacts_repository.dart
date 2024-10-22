import '../models/contacts/failure/contacts_failure.dart';
import '../models/contacts/success/contacts_success.dart';
import '../responses/contacts/contacts_response.dart';
import '../typedefs.dart';

abstract class ContactsRepository {
  FutureEither<ContactsFailure, ContactResponse> create(
    ContactResponse contact,
  );
  FutureEither<ContactsFailure, List<ContactResponse>> getAll();
  FutureEither<ContactsFailure, ContactResponse> update(
    ContactResponse contact,
  );
  FutureEither<ContactsFailure, ContactsSuccess> delete(
    String id,
  );
  FutureEither<ContactsFailure, String> uploadImage(
    String pathImage,
  );
}
