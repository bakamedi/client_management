import '../../domain/respositories/db_repository.dart';
import '../data_source/providers/db_provider.dart';

class DbRepositoryImpl extends DbRepository {
  final DbProvider _dbProvider;

  DbRepositoryImpl({
    required DbProvider dbProvider,
  }) : _dbProvider = dbProvider;

  @override
  Future<void> close() async {
    await _dbProvider.close();
  }

  @override
  Future<void> connect() async {
    await _dbProvider.connect();
  }
}
