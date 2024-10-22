// Define tus métodos personalizados usando una extensión
import '../../domain/responses/contacts/contacts_response.dart';

extension ContactsExt on ContactResponse {
  // Función para unir nombres y apellidos
  String get fullName => '$names $lastName';

  // Función para obtener las primeras letras de cada uno
  String get initials {
    String firstLetterOfName = names!.isNotEmpty ? names![0] : '';
    String firstLetterOfLastName = lastName!.isNotEmpty ? lastName![0] : '';
    return '$firstLetterOfName$firstLetterOfLastName'.toUpperCase();
  }
}
