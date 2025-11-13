import '../../../core/utils/http_status_code_util.dart';
import '../../../domain/either.dart';
import '../../../domain/models/auth/failure/sign_in_failure.dart';
import '../../../domain/models/auth/token_model.dart';
import '../../../domain/typedefs.dart';
import '../../helpers/http/http_helper.dart';
import '../../helpers/http/http_method.dart';
import 'device_provider.dart';

class AuthProvider {
  AuthProvider({
    required HttpHelper http,
    required DeviceUtilProvider deviceUtilProvider,
  }) : _http = http,
       _deviceUtilProvider = deviceUtilProvider;
  final HttpHelper _http;
  final DeviceUtilProvider _deviceUtilProvider;

  FutureEither<SignInFailure, TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _http.request(
      'auth/login/',
      method: HttpMethod.POST,
      data: {"email": email, "password": password},
    );

    return result.when(
      success: (statusCode, data) async {
        final response = tokenModelFromJson(data);
        await _deviceUtilProvider.setAccessToken(response.data.accessToken);
        await _deviceUtilProvider.setRefreshToken(response.data.refreshToken);
        await _deviceUtilProvider.setNames(response.data.names ?? '');
        await _deviceUtilProvider.setLastName(response.data.lastName ?? '');
        await _deviceUtilProvider.setProfileImage(
          response.data.profileImage ?? '',
        );
        return Either.right(response);
      },
      networkError: (stackTrace) {
        return const Either.left(SignInFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(SignInFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        if (statusCode == HttpStatusCode.badRequest) {
          return const Either.left(SignInFailure.notFound());
        }
        if (statusCode == HttpStatusCode.forbidden) {
          return const Either.left(SignInFailure.invalidPassword());
        }
        return const Either.left(SignInFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(SignInFailure.internetConnection());
      },
    );
  }

  FutureEither<SignInFailure, TokenModel> signUp({
    required String email,
    required String password,
    required String names,
    required String lastName,
  }) async {
    final result = await _http.request(
      'auth/register/',
      method: HttpMethod.POST,
      data: {
        "names": names,
        "lastName": lastName,
        "email": email,
        "password": password,
        "role": "ADMIN",
      },
    );

    return result.when(
      success: (statusCode, data) async {
        final response = tokenModelFromJson(data);
        await _deviceUtilProvider.setAccessToken(response.data.accessToken);
        await _deviceUtilProvider.setRefreshToken(response.data.refreshToken);
        await _deviceUtilProvider.setNames(response.data.names ?? '');
        await _deviceUtilProvider.setLastName(response.data.lastName ?? '');
        await _deviceUtilProvider.setProfileImage(
          response.data.profileImage ?? '',
        );
        return Either.right(response);
      },
      networkError: (stackTrace) {
        return const Either.left(SignInFailure.network());
      },
      timeOut: (stackTrace) {
        return const Either.left(SignInFailure.timeOut());
      },
      unhandledError: (statusCode, stackTrace) {
        if (statusCode == HttpStatusCode.badRequest) {
          return const Either.left(SignInFailure.notFound());
        }
        if (statusCode == HttpStatusCode.forbidden) {
          return const Either.left(SignInFailure.invalidPassword());
        }
        return const Either.left(SignInFailure.unhandledException());
      },
      internetConnection: () {
        return const Either.left(SignInFailure.internetConnection());
      },
    );
  }
}
