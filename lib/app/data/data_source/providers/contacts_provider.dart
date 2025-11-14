import 'package:client_management/app/data/data_source/providers/supabase_provider.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

import '../../../domain/either.dart';
import '../../../domain/models/contacts/failure/contacts_failure.dart';
import '../../../domain/models/contacts/success/contacts_success.dart';
import '../../../domain/responses/contacts/contacts_response.dart';
import '../../../domain/responses/contacts/upload/upload_contact_response.dart';
import '../../../domain/typedefs.dart';
import '../../helpers/http/http_helper.dart';
import '../../helpers/http/http_method.dart';
import 'device_provider.dart';

class ContactsProvider {
  ContactsProvider({
    required HttpHelper http,
    required SupabaseProvider supabaseProvider,
    required DeviceUtilProvider deviceUtilProvider,
  }) : _http = http,
       _supabaseProvider = supabaseProvider,
       _deviceUtilProvider = deviceUtilProvider;
  final HttpHelper _http;
  final SupabaseProvider _supabaseProvider;
  final DeviceUtilProvider _deviceUtilProvider;

  FutureEither<ContactsFailure, ContactResponse> create(
    ContactResponse contact,
  ) async {
    try {
      final result = await _supabaseProvider.client
          .from('Contact')
          .insert({
            'names': contact.names,
            'last_names': contact.lastName,
            'phone': contact.phoneNumber,
            'cellphone': contact.cellPhoneNumber,
            'url_image': contact.profileImage,
            'user_id': _supabaseProvider.client.auth.currentUser!.id,
          })
          .select()
          .single();

      // El result viene como Map<String, dynamic>
      final created = ContactResponse.fromJson(result);

      return Either.right(created);
    } catch (e) {
      print('CREATE CONTACT ERROR: $e');
      return const Either.left(ContactsFailure.unhandledException());
    }
  }

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
        return const Either.left(ContactsFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(ContactsFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        return const Either.left(ContactsFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(ContactsFailure.network());
      },
    );
  }

  FutureEither<ContactsFailure, ContactResponse> update(
    ContactResponse contact,
  ) async {
    final accessToken = await _deviceUtilProvider.accessToken;

    final result = await _http.request(
      'user/${contact.id}',
      method: HttpMethod.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      data: contactResponseToJson(contact),
    );

    return result.when(
      success: (statusCode, data) {
        final user = contactSimpleResponseFromJson(data);
        return Either.right(user.data);
      },
      networkError: (stackTrace) {
        return const Either.left(ContactsFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(ContactsFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        return const Either.left(ContactsFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(ContactsFailure.network());
      },
    );
  }

  FutureEither<ContactsFailure, ContactsSuccess> delete(String id) async {
    final accessToken = await _deviceUtilProvider.accessToken;

    final result = await _http.request(
      'user/$id',
      method: HttpMethod.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    return result.when(
      success: (statusCode, data) {
        return const Either.right(ContactsSuccess.ok());
      },
      networkError: (stackTrace) {
        return const Either.left(ContactsFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(ContactsFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        return const Either.left(ContactsFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(ContactsFailure.network());
      },
    );
  }

  FutureEither<ContactsFailure, String> uploadImage(String pathImage) async {
    final accessToken = await _deviceUtilProvider.accessToken;

    String fileName = basename(pathImage); // Obtener el nombre del archivo

    // Crear el formulario multipart para enviar el archivo
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        pathImage,
        filename: fileName, // Nombre del archivo en el servidor
      ),
    });

    // Hacer la solicitud POST a tu servidor
    final result = await _http.request(
      'user/upload/',
      method: HttpMethod.POST,
      data: formData,
      bearerToken: accessToken,
      headers: {'Content-Type': 'multipart/form-data'},
    );

    return result.when(
      success: (statusCode, data) {
        final urlData = uploadContactResponseFromJson(data);
        return Either.right(urlData.data.url);
      },
      networkError: (stackTrace) {
        return const Either.left(ContactsFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(ContactsFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        return const Either.left(ContactsFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(ContactsFailure.network());
      },
    );
  }
}
