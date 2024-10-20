import '../models/contacts/failure/contacts_failure.dart';
import '../models/contacts/success/contacts_success.dart';
import '../typedefs.dart';

abstract class ContactsRepository {
  FutureEither<ContactsFailure, ContactsSuccess> getAll();
}
