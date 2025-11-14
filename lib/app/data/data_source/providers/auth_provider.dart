import 'package:client_management/app/data/data_source/providers/supabase_provider.dart';
import 'package:client_management/app/domain/models/success/success.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/either.dart';
import '../../../domain/models/auth/failure/sign_in_failure.dart';
import '../../../domain/models/auth/token_model.dart';
import '../../../domain/typedefs.dart';
import 'device_provider.dart';

class AuthProvider {
  AuthProvider({
    required SupabaseProvider supabaseProvider,
    required DeviceUtilProvider deviceUtilProvider,
  }) : _supabaseProvider = supabaseProvider,
       _deviceUtilProvider = deviceUtilProvider;
  final SupabaseProvider _supabaseProvider;
  final DeviceUtilProvider _deviceUtilProvider;

  FutureEither<SignInFailure, TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return const Either.right(
        TokenModel(
          data: DataTokenModel(
            accessToken: 'accessToken',
            refreshToken: 'refreshToken',
          ),
        ),
      );
    } catch (e) {
      return const Either.left(SignInFailure.unhandledException());
    }
  }

  FutureEither<SignInFailure, Success> signUp({
    required String email,
    required String password,
    required String names,
    required String lastName,
  }) async {
    try {
      final result = await _supabaseProvider.auth.signUp(
        email: email,
        password: password,
        data: {"names": names, "lastName": lastName},
      );
      if (result.user == null && result.session == null) {
        return const Either.left(SignInFailure.unhandledException());
      }
      await _deviceUtilProvider.setNames(names);
      await _deviceUtilProvider.setLastName(lastName);
      await _deviceUtilProvider.setAccessToken(
        result.session?.accessToken ?? '',
      );
      await _deviceUtilProvider.setRefreshToken(
        result.session?.refreshToken ?? '',
      );
      return const Either.right(Success());
    } on AuthException catch (e) {
      if (e.message.contains('User already registered')) {
        return const Either.left(SignInFailure.emailAlreadyExists());
      }
      return const Either.left(SignInFailure.unhandledException());
    } catch (e) {
      return const Either.left(SignInFailure.unhandledException());
    }
  }
}
