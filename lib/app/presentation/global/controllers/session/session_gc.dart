// ignore_for_file: non_constant_identifier_names

import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/respositories/device_utils_repository.dart';
import '../../../../injection_providers.dart';
import 'session_state.dart';

final sessionGP = Provider.state<SessionGC, SessionState>(
  (_) => SessionGC(
    SessionState.initialState,
    deviceUtilsRepository: Repositories.deviceUtilRep.read(),
  ),
  autoDispose: false,
);

class SessionGC extends StateNotifier<SessionState> {
  SessionGC(
    super.initialState, {
    required DeviceUtilsRepository deviceUtilsRepository,
  }) : _deviceUtilsRepository = deviceUtilsRepository {
    _init();
  }
  final DeviceUtilsRepository _deviceUtilsRepository;

  String get names => state.names ?? '';
  String get lastName => state.lastName ?? '';
  String get profileImage => state.profileImage ?? '';

  Future<void> _init() async {
    final names = await _deviceUtilsRepository.names;
    final lastName = await _deviceUtilsRepository.lastName;
    final profileImage = await _deviceUtilsRepository.profileImage;
    state = state.copyWith(
      names: names,
      lastName: lastName,
      profileImage: profileImage,
    );
  }
}
