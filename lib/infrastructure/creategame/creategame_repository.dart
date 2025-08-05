import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tournamentapp/domain/creategame/i_creategame_repository.dart';
import 'package:tournamentapp/infrastructure/core/dio_client.dart';
import 'package:tournamentapp/presentation/injection.dart';

@LazySingleton(as: ICreategameRepository)
class CreategameRepository implements ICreategameRepository {
  final _dioClient = getIt<DioClient>();

  @override
  Future getPlayer() async {
    try {
      print('going to getplayer');
      final loginResponse = await _dioClient.httpWithRetries(
          method: 'GET',
          path: 'api//api/PlayerRegister/GetPlayer',
          repeat: 3,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      print('got response from getplayer');
      print("the value of getplayer is $loginResponse");
      final resulttoken = loginResponse.data['resultData'];
      Map data = jsonDecode(resulttoken);

      if (loginResponse.data["statusCode"] != 200) {
        return "Something went wrong";
      } else {}
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }
}
