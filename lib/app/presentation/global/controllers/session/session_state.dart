import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState({
    String? names,
    String? lastName,
    String? profileImage,
  }) = _SessionState;

  static SessionState get initialState =>
      const SessionState(names: '', lastName: '', profileImage: '');
}
