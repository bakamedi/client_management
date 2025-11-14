import 'package:client_management/app/domain/respositories/supabase_repository.dart';
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
    supabaseRepository: Repositories.supabaseRep.read(),
  ),
);

class SplashController extends StateNotifier<SplashState> {
  SplashController(
    super.initialState, {
    required DeviceUtilsRepository deviceUtilsRepository,
    required DbRepository dbRepository,
    required SupabaseRepository supabaseRepository,
  }) : _deviceUtilsRepository = deviceUtilsRepository,
       _dbRepository = dbRepository,
       _supabaseRepository = supabaseRepository {
    _init();
  }
  final DeviceUtilsRepository _deviceUtilsRepository;
  final DbRepository _dbRepository;
  final SupabaseRepository _supabaseRepository;

  void _init() async {
    await _supabaseRepository.initialize();
    await _dbRepository.connect();
    final accessToken = await _deviceUtilsRepository.accessToken;
    final validToken = accessToken.isJwtToken && !accessToken.isJwtExpired;
    final route = validToken ? ContactsRoute.path : SignInRoute.path;

    Future.delayed(const Duration(seconds: 2), () {
      onlyUpdate(
        state = state.copyWith(
          isJwtToken: accessToken.isJwtToken,
          routeName: route,
        ),
      );
    });
  }
}
