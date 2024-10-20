import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_failure.freezed.dart';

@freezed
class SignInFailure with _$SignInFailure {
  const factory SignInFailure.network() = _Network;
  const factory SignInFailure.timeOut() = _TimeOut;
  const factory SignInFailure.notFound() = _NotFound;
  const factory SignInFailure.invalidPassword() = _InvalidPassword;
  const factory SignInFailure.error() = _Error;
  const factory SignInFailure.unhandledException() = _UnhandledException;
  const factory SignInFailure.internetConnection() = _InternetConnection;
}
