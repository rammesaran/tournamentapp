import 'pair_set.dart';
import 'match_schedule.dart';

class LiveMatchResponse {
  final List<PairSet> lstpairset;
  final List<MatchSchedule> lstmatchscdl;

  LiveMatchResponse({
    required this.lstpairset,
    required this.lstmatchscdl,
  });

  factory LiveMatchResponse.fromJson(Map<String, dynamic> json) {
    return LiveMatchResponse(
      lstpairset: (json['lstpairset'] as List<dynamic>?)
              ?.map((item) => PairSet.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      lstmatchscdl: (json['lstmatchscdl'] as List<dynamic>?)
              ?.map((item) =>
                  MatchSchedule.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lstpairset': lstpairset.map((item) => item.toJson()).toList(),
      'lstmatchscdl': lstmatchscdl.map((item) => item.toJson()).toList(),
    };
  }
}
