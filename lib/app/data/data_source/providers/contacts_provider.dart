import '../../../domain/either.dart';
import '../../../domain/models/contacts/failure/contacts_failure.dart';
import '../../../domain/responses/contacts/contacts_response.dart';
import '../../../domain/typedefs.dart';
import '../../helpers/http/http_helper.dart';

class ContactsProvider {
  final HttpHelper _http;

  ContactsProvider({required HttpHelper http}) : _http = http;

  FutureEither<ContactsFailure, ContactsResponse> getAll() async {
    final result = await _http.request(
      'user/',
    );

    return result.when(
      success: (statusCode, data) {
        final user = contactsResponseFromJson(data);
        return Either.right(user);
      },
      networkError: (stackTrace) {
        return const Either.left(
          ContactsFailure.network(),
        );
      },
      timeOut: (stackTrace) {
        return const Either.left(
          ContactsFailure.timeOut(),
        );
      },
      unhandledError: (statusCode, stackTrace) {
        return const Either.left(
          ContactsFailure.unhandledException(),
        );
      },
      internetConnection: () {
        return const Either.left(
          ContactsFailure.network(),
        );
      },
    );
  }
}
