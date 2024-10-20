import 'dart:convert';

extension StringExt on String {
  bool get isValidEmail {
    return RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    ).hasMatch(this);
  }

  bool get isValidName {
    return RegExp(
      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$",
    ).hasMatch(this);
  }

  bool get isValidPassword {
    return length > 6;
  }

  String get getInitials {
    List<String> nameParts = split(' ');
    String initials = '';

    for (String part in nameParts) {
      initials += part.substring(0, 1);
    }

    return initials;
  }

  String concat(String cat) {
    return this + cat;
  }

  bool get maxLengthOtp => length == 4;

  bool get isJwtToken {
    if (isEmpty) {
      return isEmpty;
    }
    List<String> parts = split('.');

    if (parts.length != 3) {
      return false;
    }

    try {
      base64Url.decode(base64Url.normalize(parts[0]));
      base64Url.decode(base64Url.normalize(parts[1]));
      base64Url.decode(base64Url.normalize(parts[2]));
    } catch (e) {
      return false;
    }

    // Intentar decodificar el payload para asegurarse de que es un JSON válido
    try {
      String payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      Map<String, dynamic> decodedPayload = jsonDecode(payload);

      // Opcional: Verificar que el payload contiene campos típicos de un JWT

      return decodedPayload.containsKey('iat');
    } catch (e) {
      return false;
    }
  }

  String get capitalizeFirstLetter {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
