import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/respositories/db_repository.dart';
import '../../../../domain/respositories/device_utils_repository.dart';
import '../../../../injection_providers.dart';
import '../../../router/app_routes/contacts_route.dart';
import '../../../router/app_routes/sign_in_route.dart';
import './../../../extensions/strings_ext.dart';
import 'splash_state.dart';

final splashProvider = Provider.state<SplashController, SplashState>(
  (_) => SplashController(
    SplashState.initialState,
    deviceUtilsRepository: Repositories.deviceUtilRep.read(),
    dbRepository: Repositories.dbRep.read(),
  ),
);

class SplashController extends StateNotifier<SplashState> {
  final DeviceUtilsRepository _deviceUtilsRepository;
  final DbRepository _dbRepository;

  SplashController(
    super.initialState, {
    required DeviceUtilsRepository deviceUtilsRepository,
    required DbRepository dbRepository,
  })  : _deviceUtilsRepository = deviceUtilsRepository,
        _dbRepository = dbRepository {
    init();
  }

  void init() async {
    await _dbRepository.connect();
    final accessToken = await _deviceUtilsRepository.accessToken;
    final route =
        accessToken.isJwtToken ? ContactsRoute.path : SignInRoute.path;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        onlyUpdate(
          state = state.copyWith(
            isJwtToken: accessToken.isJwtToken,
            routeName: route,
          ),
        );
      },
    );
  }
}
