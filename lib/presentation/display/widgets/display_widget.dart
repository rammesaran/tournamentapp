import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tournamentapp/application/getplayer/getplayer_bloc.dart';
import 'package:tournamentapp/presentation/livematch/livematch_page.dart';
import 'package:tournamentapp/presentation/routes/router.gr.dart';

class PairsDisplayWidget extends StatefulWidget {
  const PairsDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PairsDisplayWidget> createState() => _PairsDisplayWidgetState();
}

class _PairsDisplayWidgetState extends State<PairsDisplayWidget> {
  List<Map<String, dynamic>> pairs = [];

  List<Map<String, dynamic>> _extractCleanPairsData(dynamic lstpairs) {
    if (lstpairs == null) return [];

    if (lstpairs is List && lstpairs.isNotEmpty) {
      // Find the first element that is a List (contains actual pairs)
      for (var element in lstpairs) {
        if (element is List) {
          return element.whereType<Map<String, dynamic>>().toList();
        }
      }

      // If no nested list found, check if elements are directly Maps
      return lstpairs.whereType<Map<String, dynamic>>().toList();
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badminton App'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<GetplayerBloc, GetplayerState>(
        listener: (context, listenerstate) {
          print("the listenerstat is aaa ${listenerstate.statusCode}");
          // TODO: implement listener
        },
        child: BlocBuilder<GetplayerBloc, GetplayerState>(
          builder: (context, getplayerstate) {
            print("the listenerstat is ${getplayerstate.statusCode}");
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Create game Tournament/Casual play',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Checkboxes
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'shuffle',
                            style: TextStyle(color: Colors.teal),
                          ),
                          SizedBox(width: 32),
                          Text(
                            'Tournament',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Pairs Grid
                  Expanded(
                    child: ListView.builder(
                      itemCount: getplayerstate.players?.length,
                      itemBuilder: (context, index) {
                        print(
                            "the getplayer is ${getplayerstate.players?.values.toList()}");
                        final pair = getplayerstate.players?["lstpairs"][index];
                        print("the pair value is $pairs");
                        final pairNames =
                            pair['Pair']?.toString().split(' - ') ?? [];
                        final teamName = pair['Team']?.toString() ?? '';

                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.grey.shade200
                                : Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                // Team indicator (optional)
                                Container(
                                  width: 4,
                                  height: 40,
                                  color: _getTeamColor(index),
                                  margin: EdgeInsets.only(right: 12),
                                ),
                                // Pair names
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (teamName.isNotEmpty)
                                        Text(
                                          teamName,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      Text(
                                        pairNames.length >= 2
                                            ? '${pairNames[0]} - ${pairNames[1]}'
                                            : pair['Pair']?.toString() ??
                                                'Unknown Pair',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16),

                  // Status message
                  if (getplayerstate.players?['Status'] != null)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8),
                          Text(
                            getplayerstate.players!['Status'].toString(),
                            style: TextStyle(color: Colors.green.shade800),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 16),

                  // Bottom description
                  Text(
                    'The shuffled player\'s show in the grid.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue.shade800,
                    ),
                  ),

                  SizedBox(height: 24),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print(
                              "the data of state is ${getplayerstate.players}");
                          BlocProvider.of<GetplayerBloc>(context).add(
                              GetplayerEvent.reshuffle(
                                  data: getplayerstate.pairData ?? []));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Re-shuffling pairs...')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text('Re-Shuffle'),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          List<Map<String, dynamic>> cleanPairsData =
                              _extractCleanPairsData(
                                  getplayerstate.players?["lstpairs"]);
                          print("the data of state is $cleanPairsData");
                          BlocProvider.of<GetplayerBloc>(context).add(
                              GetplayerEvent.saveTournament(
                                  data: cleanPairsData));
                          BlocProvider.of<GetplayerBloc>(context)
                              .add(GetplayerEvent.getPairSet(companyId: 12));

                          AutoRouter.of(context).replace(LiveMatchRoute());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Creating game...')),
                          );
                          // if (getplayerstate.statusCode == 200) {

                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text('Create Game'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getTeamColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }
}
