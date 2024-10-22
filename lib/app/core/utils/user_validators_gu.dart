// ignore_for_file: constant_identifier_names

import '../../presentation/extensions/strings_ext.dart';

const int MAX_PHONE_LENGTH = 9;
const int MAX_CALENDAR_LENGTH = 10;
const int MIN_PASSWORD_LENGTH = 6;
const int LEGAL_AGE = 18;
const String EMAIL_REGEX = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';

class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El teléfono no puede estar vacío';
    }

    if (value.length != MAX_PHONE_LENGTH) {
      return 'El telefono tiene que tener 10 números';
    }

    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'El teléfono solo puede contener caracteres alfanuméricos';
    }

    return null;
  }
}

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email no puede estar vacío';
    } else if (!value.isValidEmail) {
      return 'El email no es válido';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    } else if (value.length < MIN_PASSWORD_LENGTH) {
      return 'La contraseña debe tener al menos 6 caracteres';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'La confirmación de contraseña no puede estar vacía';
    }

    if (password != confirmPassword) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }
}

abstract class UserValidator {
  static String? validatePhoneNumber(String? value) {
    return PhoneValidator.validate(value);
  }

  static String? validateEmail(String? value) {
    return EmailValidator.validate(value);
  }

  static String? validatePassword(String? value) {
    return PasswordValidator.validate(value);
  }

  static String? confirmPassword(String? value1, String? value2) {
    return PasswordValidator.validateConfirmPassword(value1, value2);
  }
}
