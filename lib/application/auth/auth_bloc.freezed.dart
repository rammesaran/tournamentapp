// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() isLoggedIn,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? isLoggedIn,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? isLoggedIn,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_IsLoggedIn value) isLoggedIn,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_IsLoggedIn value)? isLoggedIn,
    TResult? Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_IsLoggedIn value)? isLoggedIn,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() isLoggedIn,
    required TResult Function() logout,
  }) {
    return login(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? isLoggedIn,
    TResult? Function()? logout,
  }) {
    return login?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? isLoggedIn,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_IsLoggedIn value) isLoggedIn,
    required TResult Function(_Logout value) logout,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_IsLoggedIn value)? isLoggedIn,
    TResult? Function(_Logout value)? logout,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_IsLoggedIn value)? isLoggedIn,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(
      {required final String email,
      required final String password}) = _$LoginImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoggedInImplCopyWith<$Res> {
  factory _$$IsLoggedInImplCopyWith(
          _$IsLoggedInImpl value, $Res Function(_$IsLoggedInImpl) then) =
      __$$IsLoggedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoggedInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$IsLoggedInImpl>
    implements _$$IsLoggedInImplCopyWith<$Res> {
  __$$IsLoggedInImplCopyWithImpl(
      _$IsLoggedInImpl _value, $Res Function(_$IsLoggedInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsLoggedInImpl implements _IsLoggedIn {
  const _$IsLoggedInImpl();

  @override
  String toString() {
    return 'AuthEvent.isLoggedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoggedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() isLoggedIn,
    required TResult Function() logout,
  }) {
    return isLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? isLoggedIn,
    TResult? Function()? logout,
  }) {
    return isLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? isLoggedIn,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (isLoggedIn != null) {
      return isLoggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_IsLoggedIn value) isLoggedIn,
    required TResult Function(_Logout value) logout,
  }) {
    return isLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_IsLoggedIn value)? isLoggedIn,
    TResult? Function(_Logout value)? logout,
  }) {
    return isLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_IsLoggedIn value)? isLoggedIn,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (isLoggedIn != null) {
      return isLoggedIn(this);
    }
    return orElse();
  }
}

abstract class _IsLoggedIn implements AuthEvent {
  const factory _IsLoggedIn() = _$IsLoggedInImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) login,
    required TResult Function() isLoggedIn,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? login,
    TResult? Function()? isLoggedIn,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? login,
    TResult Function()? isLoggedIn,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_IsLoggedIn value) isLoggedIn,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_IsLoggedIn value)? isLoggedIn,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_IsLoggedIn value)? isLoggedIn,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoggingInImplCopyWith<$Res> {
  factory _$$LoggingInImplCopyWith(
          _$LoggingInImpl value, $Res Function(_$LoggingInImpl) then) =
      __$$LoggingInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggingInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggingInImpl>
    implements _$$LoggingInImplCopyWith<$Res> {
  __$$LoggingInImplCopyWithImpl(
      _$LoggingInImpl _value, $Res Function(_$LoggingInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggingInImpl implements _LoggingIn {
  const _$LoggingInImpl();

  @override
  String toString() {
    return 'AuthState.loggingIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggingInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) {
    return loggingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) {
    return loggingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) {
    return loggingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) {
    return loggingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn(this);
    }
    return orElse();
  }
}

abstract class _LoggingIn implements AuthState {
  const factory _LoggingIn() = _$LoggingInImpl;
}

/// @nodoc
abstract class _$$SigninSuccessImplCopyWith<$Res> {
  factory _$$SigninSuccessImplCopyWith(
          _$SigninSuccessImpl value, $Res Function(_$SigninSuccessImpl) then) =
      __$$SigninSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUser appUser});

  $AppUserCopyWith<$Res> get appUser;
}

/// @nodoc
class __$$SigninSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigninSuccessImpl>
    implements _$$SigninSuccessImplCopyWith<$Res> {
  __$$SigninSuccessImplCopyWithImpl(
      _$SigninSuccessImpl _value, $Res Function(_$SigninSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUser = null,
  }) {
    return _then(_$SigninSuccessImpl(
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get appUser {
    return $AppUserCopyWith<$Res>(_value.appUser, (value) {
      return _then(_value.copyWith(appUser: value));
    });
  }
}

/// @nodoc

class _$SigninSuccessImpl implements _SigninSuccess {
  const _$SigninSuccessImpl({required this.appUser});

  @override
  final AppUser appUser;

  @override
  String toString() {
    return 'AuthState.signinSuccess(appUser: $appUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninSuccessImpl &&
            (identical(other.appUser, appUser) || other.appUser == appUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninSuccessImplCopyWith<_$SigninSuccessImpl> get copyWith =>
      __$$SigninSuccessImplCopyWithImpl<_$SigninSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) {
    return signinSuccess(appUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) {
    return signinSuccess?.call(appUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinSuccess != null) {
      return signinSuccess(appUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) {
    return signinSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) {
    return signinSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinSuccess != null) {
      return signinSuccess(this);
    }
    return orElse();
  }
}

abstract class _SigninSuccess implements AuthState {
  const factory _SigninSuccess({required final AppUser appUser}) =
      _$SigninSuccessImpl;

  AppUser get appUser;
  @JsonKey(ignore: true)
  _$$SigninSuccessImplCopyWith<_$SigninSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninNewImplCopyWith<$Res> {
  factory _$$SigninNewImplCopyWith(
          _$SigninNewImpl value, $Res Function(_$SigninNewImpl) then) =
      __$$SigninNewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUser appUser});

  $AppUserCopyWith<$Res> get appUser;
}

/// @nodoc
class __$$SigninNewImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigninNewImpl>
    implements _$$SigninNewImplCopyWith<$Res> {
  __$$SigninNewImplCopyWithImpl(
      _$SigninNewImpl _value, $Res Function(_$SigninNewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUser = null,
  }) {
    return _then(_$SigninNewImpl(
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get appUser {
    return $AppUserCopyWith<$Res>(_value.appUser, (value) {
      return _then(_value.copyWith(appUser: value));
    });
  }
}

/// @nodoc

class _$SigninNewImpl implements _SigninNew {
  const _$SigninNewImpl({required this.appUser});

  @override
  final AppUser appUser;

  @override
  String toString() {
    return 'AuthState.signinNew(appUser: $appUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninNewImpl &&
            (identical(other.appUser, appUser) || other.appUser == appUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninNewImplCopyWith<_$SigninNewImpl> get copyWith =>
      __$$SigninNewImplCopyWithImpl<_$SigninNewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) {
    return signinNew(appUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) {
    return signinNew?.call(appUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinNew != null) {
      return signinNew(appUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) {
    return signinNew(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) {
    return signinNew?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinNew != null) {
      return signinNew(this);
    }
    return orElse();
  }
}

abstract class _SigninNew implements AuthState {
  const factory _SigninNew({required final AppUser appUser}) = _$SigninNewImpl;

  AppUser get appUser;
  @JsonKey(ignore: true)
  _$$SigninNewImplCopyWith<_$SigninNewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigninFailedImplCopyWith<$Res> {
  factory _$$SigninFailedImplCopyWith(
          _$SigninFailedImpl value, $Res Function(_$SigninFailedImpl) then) =
      __$$SigninFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SigninFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigninFailedImpl>
    implements _$$SigninFailedImplCopyWith<$Res> {
  __$$SigninFailedImplCopyWithImpl(
      _$SigninFailedImpl _value, $Res Function(_$SigninFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SigninFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SigninFailedImpl implements _SigninFailed {
  const _$SigninFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState.signinFailed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigninFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigninFailedImplCopyWith<_$SigninFailedImpl> get copyWith =>
      __$$SigninFailedImplCopyWithImpl<_$SigninFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingIn,
    required TResult Function(AppUser appUser) signinSuccess,
    required TResult Function(AppUser appUser) signinNew,
    required TResult Function(String error) signinFailed,
  }) {
    return signinFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingIn,
    TResult? Function(AppUser appUser)? signinSuccess,
    TResult? Function(AppUser appUser)? signinNew,
    TResult? Function(String error)? signinFailed,
  }) {
    return signinFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingIn,
    TResult Function(AppUser appUser)? signinSuccess,
    TResult Function(AppUser appUser)? signinNew,
    TResult Function(String error)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinFailed != null) {
      return signinFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingIn,
    required TResult Function(_SigninSuccess value) signinSuccess,
    required TResult Function(_SigninNew value) signinNew,
    required TResult Function(_SigninFailed value) signinFailed,
  }) {
    return signinFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingIn,
    TResult? Function(_SigninSuccess value)? signinSuccess,
    TResult? Function(_SigninNew value)? signinNew,
    TResult? Function(_SigninFailed value)? signinFailed,
  }) {
    return signinFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingIn,
    TResult Function(_SigninSuccess value)? signinSuccess,
    TResult Function(_SigninNew value)? signinNew,
    TResult Function(_SigninFailed value)? signinFailed,
    required TResult orElse(),
  }) {
    if (signinFailed != null) {
      return signinFailed(this);
    }
    return orElse();
  }
}

abstract class _SigninFailed implements AuthState {
  const factory _SigninFailed({required final String error}) =
      _$SigninFailedImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$SigninFailedImplCopyWith<_$SigninFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
