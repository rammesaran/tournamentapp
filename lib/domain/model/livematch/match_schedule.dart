class MatchSchedule {
  final String? msTeams;
  final String? msOpponents;
  final String team;
  final String opponent;

  MatchSchedule({
    this.msTeams,
    this.msOpponents,
    required this.team,
    required this.opponent,
  });

  factory MatchSchedule.fromJson(Map<String, dynamic> json) {
    return MatchSchedule(
      msTeams: json['MsTeams'],
      msOpponents: json['MsOpponents'],
      team: json['Team'] ?? '',
      opponent: json['Opponent'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MsTeams': msTeams,
      'MsOpponents': msOpponents,
      'Team': team,
      'Opponent': opponent,
    };
  }
}
