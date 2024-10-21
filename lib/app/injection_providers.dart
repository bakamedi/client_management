//import 'package:sembast/sembast.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sembast/sembast_io.dart';

import 'data/data_source/index_provider.dart';
import 'data/helpers/http/http_helper.dart';

import 'data/index_repository_impl.dart';
import 'domain/index_repositories.dart';

late DatabaseFactory _dbFactory;

void load() {
  _dbFactory = databaseFactoryIo;
}

const httpTimeout = Duration(
  seconds: 30,
);

/// Crea instancia de [Dio]
final _dio = Dio(
  BaseOptions(
    baseUrl: dotenv.env['API_BASE_URL'] ?? '',
    connectTimeout: httpTimeout,
    receiveTimeout: httpTimeout,
    sendTimeout: httpTimeout,
  ),
);

const _aO = AndroidOptions(
  encryptedSharedPreferences: true,
  resetOnError: true,
);

/// Crea la instancia del [FlutterSecureStorage]
const _storage = FlutterSecureStorage(
  aOptions: _aO,
);

/// Inicializacion de Providers

final _dbProvider = Provider(
  (ref) => DbProvider(
    databaseFactory: _dbFactory,
    store: intMapStoreFactory.store(),
  ),
);

final _deviceUtilProvider = Provider(
  (ref) => DeviceUtilProvider(
    secureStorage: _storage,
  ),
);

final _httpProvider = Provider(
  (ref) => HttpHelper(
    dio: _dio,
  ),
);

final _authProvider = Provider(
  (ref) => AuthProvider(
    http: _httpProvider.read(),
    deviceUtilProvider: _deviceUtilProvider.read(),
  ),
);

class Repositories {
  Repositories._();

  static final deviceUtilRep = Provider<DeviceUtilsRepository>(
    (ref) => DeviceUtilsRepositoryImpl(
      deviceUtilHelper: _deviceUtilProvider.read(),
    ),
  );

  static final authRep = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(
      authProvider: _authProvider.read(),
    ),
  );

  static final dbRep = Provider<DbRepository>(
    (ref) => DbRepositoryImpl(
      dbProvider: _dbProvider.read(),
    ),
  );
}
