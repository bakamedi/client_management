import '../../domain/either.dart';
import '../../domain/models/auth/failure/sign_in_failure.dart';
import '../../domain/models/auth/success/sign_in_success.dart';
import '../../domain/models/auth/token_model.dart';
import '../../domain/respositories/auth_repository.dart';
import '../../domain/typedefs.dart';
import '../data_source/providers/auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider _authProvider;

  AuthRepositoryImpl({
    required AuthProvider authProvider,
  }) : _authProvider = authProvider;

  @override
  FutureEither<SignInFailure, SignInSuccess> signIn(
      String userName, String password) async {
    final result = await _authProvider.signIn(
      email: userName,
      password: password,
    );
    return result.when(
      left: (SignInFailure value) => Either.left(value),
      right: (TokenModel token) {
        return const Either.right(
          SignInSuccess.ok(),
        );
      },
    );
  }

  @override
  FutureEither<SignInFailure, SignInSuccess> signUp({
    required String names,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final result = await _authProvider.signUp(
      names: names,
      lastName: lastName,
      email: email,
      password: password,
    );
    return result.when(
      left: (SignInFailure value) => Either.left(value),
      right: (TokenModel token) {
        return const Either.right(
          SignInSuccess.ok(),
        );
      },
    );
  }
}
