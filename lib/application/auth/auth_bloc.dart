import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:tournamentapp/domain/auth/i_auth_repository.dart';
import 'package:tournamentapp/domain/core/constant.dart';
import 'package:tournamentapp/domain/user/app_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      login: (e) async* {
        yield AuthState.loggingIn();
        print('bloc: login in');

        final result = await _authRepository.login(
            userName: e.email, password: e.password);
        print('bloc: result $result');
        if (result is AppUser) {
          yield AuthState.signinSuccess(appUser: result);
        } else {
          yield AuthState.signinFailed(error: result.toString());
        }
      },
      logout: (e) async* {
        await _authRepository.logout();
        yield AuthState.initial();
      },
      isLoggedIn: (e) async* {
        print('bloc: isLoggedIn ');
        final result = await _authRepository.isLoggedIn();
        print('bloc isLoggedIn: result $result');
        if (result is AppUser) {
        } else {
          yield AuthState.signinFailed(error: result.toString());
        }
      },
    );
  }
}
