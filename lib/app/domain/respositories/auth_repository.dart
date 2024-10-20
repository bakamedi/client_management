import '../models/auth/failure/sign_in_failure.dart';
import '../models/auth/success/sign_in_success.dart';
import '../typedefs.dart';

abstract class AuthRepository {
  FutureEither<SignInFailure, SignInSuccess> signIn(
    String userName,
    String password,
  );
}
