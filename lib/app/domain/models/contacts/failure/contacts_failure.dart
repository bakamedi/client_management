import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_failure.freezed.dart';

@freezed
class ContactsFailure with _$ContactsFailure {
  const factory ContactsFailure.network() = _Network;
  const factory ContactsFailure.timeOut() = _TimeOut;
  const factory ContactsFailure.notFound() = _NotFound;
  const factory ContactsFailure.invalidPassword() = _InvalidPassword;
  const factory ContactsFailure.unhandledException() = _UnhandledException;
}
