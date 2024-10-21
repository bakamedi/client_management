abstract class DeviceUtilsRepository {
  Future<String> get accessToken;
  Future<void> setAccessToken(String token);
}
