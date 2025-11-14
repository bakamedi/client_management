import 'package:client_management/app/domain/models/success/success.dart';

import '../models/auth/failure/sign_in_failure.dart';
import '../typedefs.dart';

abstract class AuthRepository {
  FutureEither<SignInFailure, Success> signIn(String userName, String password);

  FutureEither<SignInFailure, Success> signUp({
    required String names,
    required String lastName,
    required String email,
    required String password,
  });

  FutureEither<SignInFailure, Success> logOut();
}
