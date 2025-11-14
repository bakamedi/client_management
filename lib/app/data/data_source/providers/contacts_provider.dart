import 'dart:io';

import 'package:client_management/app/data/data_source/providers/supabase_provider.dart';
import 'package:path/path.dart';

import '../../../domain/either.dart';
import '../../../domain/models/contacts/failure/contacts_failure.dart';
import '../../../domain/models/contacts/success/contacts_success.dart';
import '../../../domain/responses/contacts/contacts_response.dart';
import '../../../domain/typedefs.dart';

class ContactsProvider {
  ContactsProvider({required SupabaseProvider supabaseProvider})
    : _supabaseProvider = supabaseProvider;
  final SupabaseProvider _supabaseProvider;

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
      return const Either.left(ContactsFailure.unhandledException());
    }
  }

  FutureEither<ContactsFailure, ContactsResponse> getAll() async {
    try {
      final result = await _supabaseProvider.client.from('Contact').select();

      final contacts = result.map((e) => ContactResponse.fromJson(e)).toList();

      return Either.right(ContactsResponse(data: contacts));
    } catch (e) {
      return const Either.left(ContactsFailure.unhandledException());
    }
  }

  FutureEither<ContactsFailure, ContactResponse> update(
    ContactResponse contact,
  ) async {
    try {
      final result = await _supabaseProvider.client
          .from('Contact')
          .update({
            'names': contact.names,
            'last_names': contact.lastName,
            'phone': contact.phoneNumber,
            'cellphone': contact.cellPhoneNumber,
            'url_image': contact.profileImage,
          })
          .eq('id', contact.id ?? '')
          .eq('user_id', _supabaseProvider.client.auth.currentUser!.id)
          .select();

      if (result.isEmpty) {
        return const Either.left(ContactsFailure.unhandledException());
      }

      final updatedContact = ContactResponse.fromJson(result.first);

      return Either.right(updatedContact);
    } catch (e) {
      return const Either.left(ContactsFailure.unhandledException());
    }
  }

  FutureEither<ContactsFailure, ContactsSuccess> delete(String id) async {
    try {
      await _supabaseProvider.client.from('Contact').delete().eq('id', id);

      return const Either.right(ContactsSuccess.ok());
    } catch (e) {
      return const Either.left(ContactsFailure.unhandledException());
    }
  }

  FutureEither<ContactsFailure, String> uploadImage(String pathImage) async {
    try {
      final file = File(pathImage);
      final fileName = basename(pathImage);
      final userId = _supabaseProvider.client.auth.currentUser!.id;
      final uploadPath = '$userId/$fileName';

      await _supabaseProvider.client.storage
          .from('uploads')
          .uploadBinary(uploadPath, file.readAsBytesSync());

      final imageUrl = _supabaseProvider.client.storage
          .from('uploads')
          .getPublicUrl(uploadPath);

      return Either.right(imageUrl);
    } catch (e) {
      return const Either.left(ContactsFailure.unhandledException());
    }
  }
}
