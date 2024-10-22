// ignore_for_file: library_prefixes

import '../../domain/respositories/device_utils_repository.dart';
import '../data_source/providers/device_provider.dart';

class DeviceUtilsRepositoryImpl implements DeviceUtilsRepository {
  final DeviceUtilProvider _deviceUtilHelper;

  DeviceUtilsRepositoryImpl({
    required DeviceUtilProvider deviceUtilHelper,
  }) : _deviceUtilHelper = deviceUtilHelper;

  @override
  Future<String> get accessToken async => await _deviceUtilHelper.accessToken;

  @override
  Future<void> setAccessToken(String token) async {
    await _deviceUtilHelper.setAccessToken(token);
  }

  @override
  Future<String> get names async => await _deviceUtilHelper.names;

  @override
  Future<String> get lastName async => await _deviceUtilHelper.lastName;

  @override
  Future<String> get profileImage async => await _deviceUtilHelper.profileImage;
}
