import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tournamentapp/domain/home/i_home_repository.dart';
import 'package:tournamentapp/domain/model/getplayer/get_player.dart';
import 'package:tournamentapp/domain/model/livematch/live_match_response.dart';
import 'package:tournamentapp/infrastructure/core/dio_client.dart';
import 'package:tournamentapp/presentation/injection.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final _dioClient = getIt<DioClient>();

  @override
  Future getplayers() async {
    try {
      final getplayerresponse = await _dioClient.httpWithRetries(
          method: 'GET',
          path: 'api/PlayerRegister/GetPlayer',
          repeat: 3,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      print('got response from getplayer');
      print("the value of getplayers is $getplayerresponse");
      final resulttoken = getplayerresponse.data['resultData'];
      Map<String, dynamic> data = jsonDecode(resulttoken);
      // final GetPlayer userData = GetPlayer.fromJson(data);
      print(data);
      return data;

      // if (getplayerresponse.data["statusCode"] != 200) {
      //   return "Something went wrong";
      // } else {
      //   // final GetPlayer user =
      //   //     GetPlayer.fromJsonWithStringResultData(getplayerresponse.data);
      //   // print("user is $user");
      //   // return (user);
      // }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }

  @override
  Future playerShuffle(List playerName) async {
    try {
      final getplayerresponse = await _dioClient.httpWithRetries(
          method: 'POST',
          path: 'api/Tournment/PlayerShuffle',
          repeat: 3,
          data: playerName,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      print('got response from getplayer');
      print("the value of getplayers is $getplayerresponse");
      final resulttoken = getplayerresponse.data['resultData'];
      Map<String, dynamic> data = jsonDecode(resulttoken);
      print(data);
      return data;

      // }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }

  @override
  Future reShuffle(List playerName) async {
    try {
      final getplayerresponse = await _dioClient.httpWithRetries(
          method: 'POST',
          path: 'api/Tournment/PlayerShuffle',
          repeat: 3,
          data: playerName,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      print('got response from getplayer');
      print("the value of getplayers is $getplayerresponse");
      final resulttoken = getplayerresponse.data['resultData'];
      Map<String, dynamic> data = jsonDecode(resulttoken);
      print(data);
      return data;

      // }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }

  @override
  Future saveTournament(List palyerdata) async {
    try {
      final getplayerresponse = await _dioClient.httpWithRetries(
          method: 'POST',
          path: 'api/Tournment/SaveTournament',
          repeat: 3,
          data: palyerdata,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      final resulttoken = getplayerresponse.data['statusCode'];

      if (resulttoken != 200) {
        print("error");
      } else {
        return resulttoken;
      }

      // }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }

  @override
  Future getPairSet(int companyId) async {
    try {
      final getplayerresponse = await _dioClient.httpWithRetries(
          method: 'GET',
          path: 'api/Tournment/GetPairSet?CompanyId=$companyId',
          repeat: 3,
          timeout: Duration(seconds: 60),
          onTimeout: (exception) => exception);

      final resulttoken = getplayerresponse.data['resultData'];
      final statusCode = getplayerresponse.data['statusCode'];
      Map<String, dynamic> data = jsonDecode(resulttoken);

      if (statusCode != 200) {
        return "Something went wrong";
      } else {
        final LiveMatchResponse livematchresponse =
            LiveMatchResponse.fromJson(data);
        return (livematchresponse);
      }

      // }
    } on DioError catch (e) {
      return (Exception(e.toString()));
    } catch (e) {
      return (Exception(e.toString()));
    }
  }
}
