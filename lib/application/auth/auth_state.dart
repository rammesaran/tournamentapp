part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loggingIn() = _LoggingIn;
  const factory AuthState.signinSuccess({required AppUser appUser}) =
      _SigninSuccess;
  const factory AuthState.signinNew({required AppUser appUser}) = _SigninNew;
  const factory AuthState.signinFailed({required String error}) = _SigninFailed;
}
