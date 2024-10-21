import '../../../domain/either.dart';
import '../../../domain/models/contacts/failure/contacts_failure.dart';
import '../../../domain/responses/contacts/contacts_response.dart';
import '../../../domain/typedefs.dart';
import '../../helpers/http/http_helper.dart';
import 'device_provider.dart';

class ContactsProvider {
  final HttpHelper _http;
  final DeviceUtilProvider _deviceUtilProvider;

  ContactsProvider({
    required HttpHelper http,
    required DeviceUtilProvider deviceUtilProvider,
  })  : _http = http,
        _deviceUtilProvider = deviceUtilProvider;

  FutureEither<ContactsFailure, ContactsResponse> getAll() async {
    final accessToken = await _deviceUtilProvider.accessToken;

    final result = await _http.request(
      'user/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
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
