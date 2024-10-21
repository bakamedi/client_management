import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/global_names_key_storage_utils.dart';

/// Clase para manipular los lso datos internos de la APP
/// usa [FlutterSecureStorage] para el storage
class DeviceUtilProvider {
  final FlutterSecureStorage _secureStorage;

  DeviceUtilProvider({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  // Métodos genéricos para leer y escribir valores en el almacenamiento seguro
  Future<String> _readValue(
    String key,
  ) async {
    try {
      final value = await _secureStorage.read(
        key: key,
      );
      return value ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> _writeValue(
    String key,
    String value,
  ) async {
    try {
      await _secureStorage.write(
        key: key,
        value: value,
      );
    } catch (e) {
      rethrow;
    }
  }
  // Variables para obtenerlas dentro de la app

  Future<String> get initialRouteName async => await _readValue(
        GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME,
      );

  Future<String> get accesToken async => await _readValue(
        GlobalNameStorageKeyUtils.ACCESS_TOKEN,
      );

  Future<String> get refreshToken async => await _readValue(
        GlobalNameStorageKeyUtils.REFRESH_TOKEN,
      );

  Future<void> setInitialRouteName(String routename) async {
    await _writeValue(
      GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME,
      routename,
    );
  }

  Future<void> setAccessToken(String token) async {
    await _writeValue(
      GlobalNameStorageKeyUtils.ACCESS_TOKEN,
      token,
    );
  }

  Future<void> setRefreshToken(String token) async {
    await _writeValue(
      GlobalNameStorageKeyUtils.REFRESH_TOKEN,
      token,
    );
  }

  Future<void> clearData() async {
    try {
      await _secureStorage.deleteAll();
    } catch (_) {}
  }
}
