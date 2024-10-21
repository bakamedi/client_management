import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const SplashState._();
  const factory SplashState({
    @Default('') String routeName,
    bool? isJwtToken,
  }) = _SplashState;

  static SplashState get initialState => const SplashState(
        routeName: '',
      );
}
