import 'package:client_management/app/domain/models/success/success.dart';

import '../models/auth/failure/sign_in_failure.dart';
import '../models/auth/success/sign_in_success.dart';
import '../typedefs.dart';

abstract class AuthRepository {
  FutureEither<SignInFailure, SignInSuccess> signIn(
    String userName,
    String password,
  );

  FutureEither<SignInFailure, Success> signUp({
    required String names,
    required String lastName,
    required String email,
    required String password,
  });
}
