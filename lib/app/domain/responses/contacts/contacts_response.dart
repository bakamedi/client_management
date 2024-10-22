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
    @JsonKey(name: "data") required List<ContactResponse> data,
  }) = _ContactsResponse;

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
}

ContactsSingleResponse contactSimpleResponseFromJson(String str) =>
    ContactsSingleResponse.fromJson(json.decode(str));

String contactSimpleResponseToJson(ContactsSingleResponse data) =>
    json.encode(data.toJson());

@freezed
class ContactsSingleResponse with _$ContactsSingleResponse {
  const factory ContactsSingleResponse({
    @JsonKey(name: "data") required ContactResponse data,
  }) = _ContactsSingleResponse;

  factory ContactsSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsSingleResponseFromJson(json);
}

ContactResponse contactResponseFromJson(String str) =>
    ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) =>
    json.encode(data.toJson());

@freezed
class ContactResponse with _$ContactResponse {
  const factory ContactResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "names") String? names,
    @JsonKey(name: "lastName") String? lastName,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "phoneNumber") String? phoneNumber,
    @JsonKey(name: "cellPhoneNumber") String? cellPhoneNumber,
    @JsonKey(name: "profileImage") String? profileImage,
  }) = _ContactResponse;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}
