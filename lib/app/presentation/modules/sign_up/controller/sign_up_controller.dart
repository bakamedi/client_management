import 'package:client_management/app/presentation/extensions/strings_ext.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../core/utils/create_field_gu.dart';

import 'sign_up_state.dart';

final signUpProvider = Provider.state<SignUpController, SignUpState>(
  (_) => SignUpController(
    SignUpState.initialState,
  ),
);

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(
    super.initialState,
  );

  String get names => state.names;

  String get lastName => state.lastName;

  String get password => state.password;

  String get email => state.email;

  String get confirmPassword => state.confirmPassword;

  bool get isFormValid => state.isFormValid;

  bool get showPassword => state.showPassword;

  void onChangeField(
    CreateFieldGU field, {
    String? value,
  }) {
    onChangeFormValid();

    switch (field) {
      case CreateFieldGU.names:
        onlyUpdate(state = state.copyWith(names: value ?? ''));
      case CreateFieldGU.lastName:
        onlyUpdate(state = state.copyWith(lastName: value ?? ''));
      case CreateFieldGU.email:
        onlyUpdate(state = state.copyWith(email: value ?? ''));
      case CreateFieldGU.password:
        onlyUpdate(state = state.copyWith(password: value ?? ''));
      case CreateFieldGU.confirmPassword:
        onlyUpdate(state = state.copyWith(confirmPassword: value ?? ''));
    }
  }

  void onChangeFormValid() {
    onlyUpdate(
      state = state.copyWith(
        isFormValid: names.isNotEmpty &&
            lastName.isNotEmpty &&
            password.isNotEmpty &&
            confirmPassword.isNotEmpty &&
            email.isValidEmail,
      ),
    );
  }

  void togglePasswordVisibility() {
    onlyUpdate(
      state = state.copyWith(
        showPassword: !state.showPassword,
      ),
    );
  }
}
