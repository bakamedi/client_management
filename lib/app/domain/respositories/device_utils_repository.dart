abstract class DeviceUtilsRepository {
  Future<String> get accessToken;
  Future<String> get names;
  Future<String> get lastName;
  Future<String> get profileImage;
  Future<void> setAccessToken(String token);
}
