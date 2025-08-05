import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tournamentapp/domain/user/app_user.dart';

abstract class IAuthRepository {
  Future login({required String userName, required String password});
  Future isLoggedIn();
  Future logout();
}
