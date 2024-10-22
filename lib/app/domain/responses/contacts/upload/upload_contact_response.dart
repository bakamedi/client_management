// To parse this JSON data, do
//
//     final uploadContactResponse = uploadContactResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'upload_contact_response.freezed.dart';
part 'upload_contact_response.g.dart';

UploadContactResponse uploadContactResponseFromJson(String str) =>
    UploadContactResponse.fromJson(json.decode(str));

String uploadContactResponseToJson(UploadContactResponse data) =>
    json.encode(data.toJson());

@freezed
class UploadContactResponse with _$UploadContactResponse {
  const factory UploadContactResponse({
    @JsonKey(name: "data") required Data data,
  }) = _UploadContactResponse;

  factory UploadContactResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadContactResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "url") required String url,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
