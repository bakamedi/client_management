import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../core/utils/update_field_gu.dart';
import '../../../../domain/models/auth/failure/sign_in_failure.dart';
import '../../../../domain/models/auth/success/sign_in_success.dart';
import '../../../../domain/respositories/auth_repository.dart';
import '../../../../domain/typedefs.dart';
import '../../../../injection_providers.dart';
import '../../../extensions/strings_ext.dart';

import 'sign_in_state.dart';

final signInProvider = Provider.state<SignInController, SignInState>(
  (_) => SignInController(
    SignInState.initialState,
    authRepository: Repositories.authRep.read(),
  ),
);

class SignInController extends StateNotifier<SignInState> {
  final AuthRepository _authRepository;

  SignInController(
    super.initialState, {
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  String get email => state.email;
  String get password => state.password;
  bool get isFormValid => state.isFormValid;
  bool get showPassword => state.showPassword;

  void togglePasswordVisibility() {
    onlyUpdate(
      state = state.copyWith(
        showPassword: !state.showPassword,
      ),
    );
  }

  void onChangeFormValid() {
    onlyUpdate(
      state = state.copyWith(
        isFormValid: email.isValidEmail && password.isValidPassword,
      ),
    );
  }

  void onChangeField(
    UpdateFieldGU field, {
    String? value,
  }) {
    switch (field) {
      case UpdateFieldGU.email:
        onlyUpdate(
          state = state.copyWith(
            email: value ?? '',
          ),
        );
        break;
      case UpdateFieldGU.password:
        onlyUpdate(
          state = state.copyWith(
            password: value ?? '',
          ),
        );
        break;
    }
    onChangeFormValid();
  }

  FutureEither<SignInFailure, SignInSuccess> signIn() async {
    return await _authRepository.signIn(
      email,
      password,
    );
  }
}
