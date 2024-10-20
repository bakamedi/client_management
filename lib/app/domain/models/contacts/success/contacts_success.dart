import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_success.freezed.dart';

@freezed
class ContactsSuccess with _$ContactsSuccess {
  const factory ContactsSuccess.empty() = _Empty;
  const factory ContactsSuccess.ok() = _Ok;
}
