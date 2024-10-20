import '../../../core/utils/http_status_code_util.dart';
import '../../../domain/either.dart';
import '../../../domain/models/auth/failure/sign_in_failure.dart';
import '../../../domain/models/auth/token_model.dart';
import '../../../domain/typedefs.dart';
import '../../helpers/http/http_helper.dart';
import '../../helpers/http/http_method.dart';

class AuthProvider {
  final HttpHelper _http;

  AuthProvider({required HttpHelper http}) : _http = http;

  FutureEither<SignInFailure, TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _http.request(
      'auth/login/',
      method: HttpMethod.POST,
      data: {
        "email": email,
        "password": password,
      },
    );

    return result.when(
      success: (statusCode, data) {
        final user = tokenModelFromJson(data);
        return Either.right(user);
      },
      networkError: (stackTrace) {
        return const Either.left(
          SignInFailure.network(),
        );
      },
      timeOut: (stackTrace) {
        return const Either.left(
          SignInFailure.timeOut(),
        );
      },
      unhandledError: (statusCode, stackTrace) {
        if (statusCode == HttpStatusCode.badRequest) {
          return const Either.left(
            SignInFailure.notFound(),
          );
        }
        if (statusCode == HttpStatusCode.forbidden) {
          return const Either.left(
            SignInFailure.invalidPassword(),
          );
        }
        return const Either.left(
          SignInFailure.unhandledException(),
        );
      },
      internetConnection: () {
        return const Either.left(
          SignInFailure.internetConnection(),
        );
      },
    );
  }
}
