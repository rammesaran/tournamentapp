part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required String email, required String password}) = _Login;

  const factory AuthEvent.isLoggedIn() = _IsLoggedIn;
  const factory AuthEvent.logout() = _Logout;
}
