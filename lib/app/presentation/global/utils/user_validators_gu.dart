// ignore_for_file: constant_identifier_names

import '../../extensions/strings_ext.dart';

const int MAX_PHONE_LENGTH = 9;
const int MAX_CALENDAR_LENGTH = 10;
const int MIN_PASSWORD_LENGTH = 6;
const String EMAIL_REGEX = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';

class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneEmpty';
    } else if (value.length != MAX_PHONE_LENGTH) {
      return 'AppLocale'.replaceAll(
        'MAX_PHONE_LENGTH',
        MAX_PHONE_LENGTH.toString(),
      );
    } else if (value.contains(RegExp(r'\D'))) {
      return 'phoneRegExp';
    } else {
      return null;
    }
  }
}

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'AppLocale.validators.emailEmpty';
    } else if (!value.isValidEmail) {
      return 'AppLocale.validators.emailRegExp';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'AppLocale.validators.passwordEmpty';
    } else if (value.length < MIN_PASSWORD_LENGTH) {
      return 'AppLocale.validators.passwordMin'.replaceAll(
        'MIN_PASSWORD_LENGTH',
        MIN_PASSWORD_LENGTH.toString(),
      );
    } else {
      return null;
    }
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
}
