// ignore_for_file: library_prefixes

import '../../domain/respositories/device_utils_repository.dart';
import '../data_source/providers/device_provider.dart';

class DeviceUtilsRepositoryImpl implements DeviceUtilsRepository {
  final DeviceUtilProvider _deviceUtilHelper;

  DeviceUtilsRepositoryImpl({
    required DeviceUtilProvider deviceUtilHelper,
  }) : _deviceUtilHelper = deviceUtilHelper;

  @override
  Future<String> get accessToken async => await _deviceUtilHelper.accesToken;

  @override
  Future<void> setAccessToken(String token) async {
    await _deviceUtilHelper.setAccessToken(token);
  }
}
