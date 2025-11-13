import 'package:path/path.dart';
import 'package:sembast/sembast.dart';

import '../../../core/utils/directory_utils.dart';

class DbProvider {
  DbProvider({
    required DatabaseFactory databaseFactory,
    required StoreRef<int, Map<String, Object?>> store,
  }) : _databaseFactory = databaseFactory;
  final DatabaseFactory _databaseFactory;
  late Database _db;

  Database get db => _db;

  Future<void> connect() async {
    final platformDir = await getDirectory();
    final dbPath = join(platformDir.path, 'my_database.db');
    _db = await _databaseFactory.openDatabase(dbPath);
  }

  Future<void> close() async {
    await _db.close();
  }
}
