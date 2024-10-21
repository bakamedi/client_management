abstract class DbRepository {
  Future<void> connect();

  Future<void> close();
}
