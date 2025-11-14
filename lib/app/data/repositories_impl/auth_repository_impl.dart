import 'package:client_management/app/domain/models/success/success.dart';

import '../../domain/models/auth/failure/sign_in_failure.dart';
import '../../domain/respositories/auth_repository.dart';
import '../../domain/typedefs.dart';
import '../data_source/providers/auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthProvider authProvider})
    : _authProvider = authProvider;
  final AuthProvider _authProvider;

  @override
  FutureEither<SignInFailure, Success> signIn(
    String userName,
    String password,
  ) async {
    return await _authProvider.signIn(email: userName, password: password);
  }

  @override
  FutureEither<SignInFailure, Success> signUp({
    required String names,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return await _authProvider.signUp(
      names: names,
      lastName: lastName,
      email: email,
      password: password,
    );
  }

  @override
  FutureEither<SignInFailure, Success> logOut() async {
    return await _authProvider.logOut();
  }
}
