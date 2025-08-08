part of 'getplayer_bloc.dart';

@freezed
abstract class GetplayerEvent with _$GetplayerEvent {
  const factory GetplayerEvent.getplayer() = _GetPlayer;
  const factory GetplayerEvent.playerShuffle({required List data}) =
      _PlayerShuffle;
  const factory GetplayerEvent.reshuffle({required List data}) = _Reshuffle;

  const factory GetplayerEvent.saveTournament({required List data}) =
      _SaveTournament;

  const factory GetplayerEvent.getPairSet({required int companyId}) =
      _GetPairSet;
}
