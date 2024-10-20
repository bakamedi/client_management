// To parse this JSON data, do
//
//     final contactsResponse = contactsResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contacts_response.freezed.dart';
part 'contacts_response.g.dart';

ContactsResponse contactsResponseFromJson(String str) =>
    ContactsResponse.fromJson(json.decode(str));

String contactsResponseToJson(ContactsResponse data) =>
    json.encode(data.toJson());

@freezed
class ContactsResponse with _$ContactsResponse {
  const factory ContactsResponse({
    @JsonKey(name: "data") required ContactResponse data,
  }) = _ContactsResponse;

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
}

@freezed
class ContactResponse with _$ContactResponse {
  const factory ContactResponse({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "role") required String role,
    @JsonKey(name: "names") required String names,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "phone_Nnumber") required String phoneNumber,
    @JsonKey(name: "cell_phone_number") required String cellPhoneNumber,
    @JsonKey(name: "profile_image") required String profileImage,
  }) = _ContactResponse;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}
