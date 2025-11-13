import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const SignInState._();
  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isFormValid,
    @Default(false) bool showPassword,
  }) = _SignInState;

  static SignInState get initialState => const SignInState(
    email: '',
    password: '',
    isFormValid: false,
    showPassword: false,
  );
}
