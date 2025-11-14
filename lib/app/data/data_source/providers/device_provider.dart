import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/global_names_key_storage_utils.dart';

/// Clase para manipular los lso datos internos de la APP
/// usa [FlutterSecureStorage] para el storage
class DeviceUtilProvider {
  DeviceUtilProvider({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;
  final FlutterSecureStorage _secureStorage;

  // Métodos genéricos para leer y escribir valores en el almacenamiento seguro
  Future<String> _readValue(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> _writeValue(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }
  // Variables para obtenerlas dentro de la app

  Future<String> get initialRouteName async =>
      await _readValue(GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME);

  Future<String> get accessToken async =>
      await _readValue(GlobalNameStorageKeyUtils.ACCESS_TOKEN);

  Future<String> get refreshToken async =>
      await _readValue(GlobalNameStorageKeyUtils.REFRESH_TOKEN);

  Future<String> get names async =>
      await _readValue(GlobalNameStorageKeyUtils.NAMES);

  Future<String> get lastName async =>
      await _readValue(GlobalNameStorageKeyUtils.LAST_NAME);

  Future<String> get profileImage async =>
      await _readValue(GlobalNameStorageKeyUtils.PROFILE_IMAGE);

  Future<void> setInitialRouteName(String routename) async {
    await _writeValue(GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME, routename);
  }

  Future<void> setAccessToken(String token) async {
    await _writeValue(GlobalNameStorageKeyUtils.ACCESS_TOKEN, token);
  }

  Future<void> setNames(String names) async {
    await _writeValue(GlobalNameStorageKeyUtils.NAMES, names);
  }

  Future<void> setLastName(String lastName) async {
    await _writeValue(GlobalNameStorageKeyUtils.LAST_NAME, lastName);
  }

  Future<void> setProfileImage(String urlProfileImage) async {
    await _writeValue(GlobalNameStorageKeyUtils.PROFILE_IMAGE, urlProfileImage);
  }

  Future<void> setRefreshToken(String token) async {
    await _writeValue(GlobalNameStorageKeyUtils.REFRESH_TOKEN, token);
  }

  Future<void> clearData() async {
    try {
      await _secureStorage.deleteAll();
    } catch (_) {}
  }

  Future<void> clearAllData() async {
    try {
      await _secureStorage.delete(
        key: GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME,
      );
      await _secureStorage.delete(key: GlobalNameStorageKeyUtils.ACCESS_TOKEN);
      await _secureStorage.delete(key: GlobalNameStorageKeyUtils.REFRESH_TOKEN);
      await _secureStorage.delete(key: GlobalNameStorageKeyUtils.NAMES);
      await _secureStorage.delete(key: GlobalNameStorageKeyUtils.LAST_NAME);
      await _secureStorage.delete(key: GlobalNameStorageKeyUtils.PROFILE_IMAGE);
    } catch (_) {}
  }
}
