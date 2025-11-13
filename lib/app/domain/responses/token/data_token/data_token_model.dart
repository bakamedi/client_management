// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_token_model.freezed.dart';
part 'data_token_model.g.dart';

/// Clase específica para `data` en TokenResponse
@freezed
abstract class DataToken with _$DataToken {
  const factory DataToken({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "token") String? token,
  }) = _DataToken;

  factory DataToken.fromJson(Map<String, dynamic> json) =>
      _$DataTokenFromJson(json);
}
