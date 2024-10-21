// Si los datos persisten después de la desinstalacion estos y cualquiera de
// los datos dentro del telefono seran borrados
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_names_key_storage_utils.dart';

/// Si los datos persisten después de la desinstalacion estos y cualquiera de
/// los datos dentro del telefono seran borrados
Future<void> verifyInternalData(
  SharedPreferences prefs,
  FlutterSecureStorage storage,
) async {
  await prefs.reload();

  final firstLoad = prefs.getBool(GlobalNameStorageKeyUtils.FIRST_LOAD) ?? true;

  if (firstLoad) {
    await storage.deleteAll();
    await prefs.clear();
    await prefs.setBool(GlobalNameStorageKeyUtils.FIRST_LOAD, false);
  }
}
