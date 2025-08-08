part of 'getplayer_bloc.dart';

@freezed
abstract class GetplayerState with _$GetplayerState {
  factory GetplayerState({
    Map<String, dynamic>? players,
    List<Map<String, dynamic>>? pairData,
    int? statusCode,
    LiveMatchResponse? livematchdata,
  }) = _GetplayerState;

  factory GetplayerState.initial() => GetplayerState(players: {});
}
