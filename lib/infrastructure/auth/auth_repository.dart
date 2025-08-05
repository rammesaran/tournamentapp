import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sembast/sembast.dart';
import 'package:tournamentapp/domain/auth/i_auth_repository.dart';
import 'package:tournamentapp/domain/user/app_user.dart';
import 'package:tournamentapp/infrastructure/core/dio_client.dart';
import 'package:tournamentapp/presentation/injection.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final _dioClient = getIt<DioClient>();

  @override
  Future isLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Future login({required String userName, required String password}) async {
    final Map<String, dynamic> loginData = {
      'UserName': userName,
      'password': password
    };

    try {
      print('going to login');
      final loginResponse = await _dioClient.httpWithRetries(
          method: 'POST',
          path: 'api/login',
          data: loginData,
          repeat: 3,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      print('got response from login');
      print("the value of loginresponse is $loginResponse");
      final resulttoken = loginResponse.data['resultData'];
      Map data = jsonDecode(resulttoken);
      String output = data['Token'];
      print("output is $output");

      _dioClient.setToken(token: output, username: userName);

      if (loginResponse is Exception) return left(loginResponse);

      if (loginResponse.data["statusCode"] != 200) {
        return "Something went wrong";
      } else {
        final AppUser user =
            AppUser.fromJsonWithStringResultData(loginResponse.data);
        return (user);
      }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }

  @override
  Future logout() async {
    return;
  }
}
