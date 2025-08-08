import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tournamentapp/presentation/core/theme_colors.dart';
import 'package:tournamentapp/presentation/livematch/widgets/livematch_widget.dart';
import 'package:tournamentapp/domain/model/livematch/pair_set.dart';
import 'package:tournamentapp/domain/model/livematch/match_schedule.dart';

@RoutePage(name: 'LiveMatchRoute')
class LiveMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data based on the provided JSON response
    // List<PairSet> teams = [
    //   PairSet(
    //     pairId: 1164,
    //     tournmentId: 2028,
    //     team: 'Team 1',
    //     pair: 'Selvam - Pandi',
    //     pairDate: DateTime.parse('2025-08-08T00:00:00'),
    //   ),
    //   PairSet(
    //     pairId: 1165,
    //     tournmentId: 2028,
    //     team: 'Team 2',
    //     pair: 'Mathan - Chandru',
    //     pairDate: DateTime.parse('2025-08-08T00:00:00'),
    //   ),
    //   PairSet(
    //     pairId: 1166,
    //     tournmentId: 2028,
    //     team: 'Team 3',
    //     pair: 'Ramesh - Sathish',
    //     pairDate: DateTime.parse('2025-08-08T00:00:00'),
    //   ),
    // ];

    // List<MatchSchedule> matchSchedule = [
    //   MatchSchedule(
    //     team: 'Selvam - Pandi',
    //     opponent: 'Ramesh - Sathish',
    //   ),
    //   MatchSchedule(
    //     team: 'Mathan - Chandru',
    //     opponent: 'Ramesh - Sathish',
    //   ),
    //   MatchSchedule(
    //     team: 'Selvam - Pandi',
    //     opponent: 'Mathan - Chandru',
    //   ),
    // ];

    return Scaffold(
      backgroundColor: CREAMY,
      body: LiveTournamentWidget(),
    );
  }
}
