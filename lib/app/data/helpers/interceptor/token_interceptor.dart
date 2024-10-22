import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/global_names_key_storage_utils.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage storage;

  TokenInterceptor(this.dio, this.storage);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Verificamos si el error es de tipo 'badResponse' y si es un 401 (Unauthorized)
    if (err.type == DioExceptionType.badResponse &&
        err.response?.statusCode == 401) {
      try {
        // Intentamos refrescar el token
        final newToken = await _refreshToken();
        if (newToken != null) {
          // Actualizamos el token en los headers
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

          // Reintentamos la solicitud con el nuevo token
          final newRequest = await dio.fetch(err.requestOptions);
          // Continuamos la ejecución con la nueva respuesta
          return handler.resolve(newRequest);
        }
      } catch (e) {
        // Manejar el error de refresco de token
      }
    }

    // Si no es un error de token o no podemos refrescar el token, continuamos con el error
    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    // Implementación para refrescar el token
    try {
      final refreshToken = await storage.read(
        key: GlobalNameStorageKeyUtils.REFRESH_TOKEN,
      );

      // Supongamos que tienes un endpoint para refrescar el token
      final response = await dio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      // Obtener el nuevo token de la respuesta
      return response.data['access_token'];
    } catch (e) {
      return null;
    }
  }
}
