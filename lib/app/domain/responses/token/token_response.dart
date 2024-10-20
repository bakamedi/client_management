import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'data_token/data_token_model.dart';

part 'token_response.freezed.dart';
part 'token_response.g.dart';

TokenResponse tokenResponseFromJson(String str) =>
    TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: "data") DataToken? data,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
}
