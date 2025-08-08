import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:tournamentapp/domain/home/i_home_repository.dart';
import 'package:tournamentapp/domain/model/livematch/live_match_response.dart';

part 'getplayer_event.dart';
part 'getplayer_state.dart';
part 'getplayer_bloc.freezed.dart';

@injectable
class GetplayerBloc extends Bloc<GetplayerEvent, GetplayerState> {
  final IHomeRepository _homeRepository;

  GetplayerBloc(this._homeRepository) : super(GetplayerState.initial());

  @override
  Stream<GetplayerState> mapEventToState(
    GetplayerEvent event,
  ) async* {
    yield* event.map(
      getplayer: (e) async* {
        // yield GetplayerState.loggingIn();

        final result = await _homeRepository.getplayers();
        print('getplayer bloc $result');
        yield state.copyWith(players: result);
      },
      playerShuffle: (e) async* {
        List<Map<String, String>> resultData = e.data
            .where((player) =>
                player['ShortName'] != null &&
                player['ShortName']
                    .toString()
                    .trim()
                    .isNotEmpty) // Filter out empty ShortNames
            .map((player) => {'PlayerName': player['ShortName'].toString()})
            .toList();

        final result = await _homeRepository.playerShuffle(resultData);
        yield state.copyWith(players: result, pairData: resultData);
      },
      reshuffle: (e) async* {
        final result = await _homeRepository.reShuffle(e.data);

        yield state.copyWith(
            players: result, pairData: e.data as List<Map<String, dynamic>>);
      },
      saveTournament: (e) async* {
        final result = await _homeRepository.saveTournament(e.data);
        print("resut $result");
        if (result == 200) {
          print("sucessfully posted");
          print(result.runtimeType);
          yield state.copyWith(
            statusCode: result,
          );
        }
      },
      getPairSet: (e) async* {
        final getpairset = await _homeRepository.getPairSet(12);
        final LiveMatchResponse data = getpairset;
        print("the live matchdata is $data");
        yield state.copyWith(livematchdata: data);
      },
    );
  }
}
