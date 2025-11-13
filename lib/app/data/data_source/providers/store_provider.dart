import 'package:sembast/sembast.dart';

import '../../../domain/typedefs.dart';
import 'db_provider.dart';

class StoreProvider {
  StoreProvider({required DbProvider dbProvider, required String storeName})
    : _dbProvider = dbProvider,
      _storeName = storeName {
    _store = intMapStoreFactory.store(_storeName);
  }
  final DbProvider _dbProvider;
  final String _storeName;
  late StoreRef<int, Map<String, Object?>> _store;

  Future<void> createRecord(Json value) async {
    try {
      await _store.add(_dbProvider.db, value);
    } catch (_) {}
  }

  Future<RecordSnapshotJson> getRecordById({Finder? finder}) async {
    final records = await _store.find(_dbProvider.db, finder: finder);
    return records.first;
  }

  Future<List<RecordSnapshotJson>> getAllRecords({Finder? finder}) async {
    final records = await _store.find(_dbProvider.db, finder: finder);
    return records;
  }

  Future<bool> updateRecord({required Json value, Finder? finder}) async {
    try {
      await _store.update(_dbProvider.db, value, finder: finder);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeRecord({Finder? finder}) async {
    try {
      await _store.delete(_dbProvider.db, finder: finder);
      return true;
    } catch (e) {
      return false;
    }
  }
}
