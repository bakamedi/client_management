// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    @JsonKey(name: "data") required DataTokenModel data,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}

@freezed
class DataTokenModel with _$DataTokenModel {
  const factory DataTokenModel({
    @JsonKey(name: "names") String? names,
    @JsonKey(name: "lastName") String? lastName,
    @JsonKey(name: "profileImage") String? profileImage,
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "refresh_token") required String refreshToken,
  }) = _DataTokenModel;

  factory DataTokenModel.fromJson(Map<String, dynamic> json) =>
      _$DataTokenModelFromJson(json);
}
