class PairSet {
  final int pairId;
  final int tournmentId;
  final String team;
  final String pair;
  final DateTime pairDate;

  PairSet({
    required this.pairId,
    required this.tournmentId,
    required this.team,
    required this.pair,
    required this.pairDate,
  });

  factory PairSet.fromJson(Map<String, dynamic> json) {
    return PairSet(
      pairId: json['PairId'] ?? 0,
      tournmentId: json['TournmentId'] ?? 0,
      team: json['Team'] ?? '',
      pair: json['Pair'] ?? '',
      pairDate:
          DateTime.parse(json['PairDate'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PairId': pairId,
      'TournmentId': tournmentId,
      'Team': team,
      'Pair': pair,
      'PairDate': pairDate.toIso8601String(),
    };
  }
}
