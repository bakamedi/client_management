import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default('') String names,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isFormValid,
    @Default(false) bool showPassword,
  }) = _SignUpState;

  static SignUpState get initialState => const SignUpState();
}
