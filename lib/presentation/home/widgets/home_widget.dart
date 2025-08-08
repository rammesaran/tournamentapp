import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sembast/sembast.dart';
import 'package:tournamentapp/application/getplayer/getplayer_bloc.dart';
import 'package:tournamentapp/presentation/display/display_page.dart';
import 'package:tournamentapp/presentation/routes/router.gr.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isShuffle = true;
  bool isTournament = true;
  //Map<String, dynamic> player = {};
  // Method to count total players
  List playersList = [];

  // void _handleSavePlayersSuccess(Map<String, dynamic> pairsData) {
  //   // Navigate to the pairs display screen
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PairsDisplayWidget(
  //         orignaldata: playersList,
  //         pairsData: pairsData,
  //         isShuffle: isShuffle,
  //         isTournament: isTournament,
  //       ),
  //     ),
  //   );
  // }

  int getTotalPlayerCount(Map<String, dynamic>? playersMap) {
    if (playersMap == null) return 0;

    int totalCount = 0;
    playersMap.entries.forEach((entry) {
      if (entry.value is List) {
        List<dynamic> playersList = entry.value as List;
        // Count only non-empty players
        totalCount += playersList.where((player) {
          if (player is Map<String, dynamic>) {
            String playerName = player['FullName']?.toString()?.trim() ?? '';
            return playerName.isNotEmpty;
          }
          return false;
        }).length;
      }
    });
    return totalCount;
  }

  bool isPlayerCountValid(Map<String, dynamic>? playersMap) {
    int totalPlayers = getTotalPlayerCount(playersMap);
    return totalPlayers > 0 && totalPlayers % 2 == 0;
  }

  void showValidationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Player Count'),
          content: Text(
            'You need an even number of players to create pairs for the game. Please add or remove players to make the count even.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Method to add a new player to the players map
  void addNewPlayer(Map<String, dynamic> playersMap) {
    // Find the key where we want to add the player (usually 'lstregplayer')
    String targetKey = 'lstregplayer';

    // Create new player object
    Map<String, dynamic> newPlayer = {
      'Initial': '',
      'FullName': '',
      'ShortName': '',
      'Email': '',
      'MobileNo': '',
      'Address': '',
      'About': 'Badminton player',
      'CreatedBy': '',
      'ImgSrc': null,
    };

    if (playersMap.containsKey(targetKey) && playersMap[targetKey] is List) {
      // Add to existing list
      List<dynamic> existingList = playersMap[targetKey] as List;
      existingList.add(newPlayer);
    } else {
      // Create new list if it doesn't exist
      playersMap[targetKey] = [newPlayer];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badminton App'),
        actions: [
          // CircleAvatar(
          //   backgroundColor: Colors.grey.shade300,
          //   child: Icon(Icons.person, color: Colors.black),
          // ),
          //SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ExpansionTile(
              leading: Icon(Icons.sports_tennis),
              title: Text('Play'),
              children: [
                ListTile(title: Text('Create Game')),
                ListTile(title: Text('Live')),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.score),
              title: Text('Results'),
              children: [
                ListTile(title: Text('Recent Results')),
                ListTile(title: Text('Leaderboard')),
              ],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Contact'),
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Player\'s Register'),
            ),
          ],
        ),
      ),
      body: BlocListener<GetplayerBloc, GetplayerState>(
        listener: (context, state) {
          if (state.players != null &&
              state.players!['Status'] == 'Saved Successfully') {
            print("the values of state palyer is ${state.players}");
            AutoRouter.of(context).replace(PairsDisplayRoute());
          }
        },
        child: BlocBuilder<GetplayerBloc, GetplayerState>(
          builder: (context, getplayerblocstate) {
            int totalPlayers = getTotalPlayerCount(getplayerblocstate.players);
            bool isValidCount = isPlayerCountValid(getplayerblocstate.players);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('Game Play',
                      style: Theme.of(context).textTheme.headline6),
                  //SizedBox(height: 8),
                  //Text('Play / Create Game', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    color: Colors.amber.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tournament',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                            'If the checkbox is "checked" the players will be shuffled randomly, and the tournament will be created.'),
                        SizedBox(height: 8),
                        Text('Causal Play',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(
                            'If the checkbox is "unchecked" the first two players will form a pair, followed by the next two players forming the next pair, and so on.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  if (totalPlayers > 0)
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: isValidCount
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isValidCount ? Colors.green : Colors.red,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isValidCount ? Icons.check_circle : Icons.error,
                            color: isValidCount ? Colors.green : Colors.red,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              isValidCount
                                  ? 'Perfect! You have $totalPlayers players (even number)'
                                  : 'Warning: You have $totalPlayers players (odd number). You need an even number to create pairs.',
                              style: TextStyle(
                                color: isValidCount
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  TextButton(
                    onPressed: isValidCount
                        ? () {
                            // Create game logic here
                            print('Creating game with $totalPlayers players');
                          }
                        : () {
                            showValidationDialog();
                          },
                    style: TextButton.styleFrom(
                      backgroundColor: isValidCount ? Colors.blue : Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Create game Tournament/Casual play'),
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isShuffle,
                                onChanged: (value) {
                                  setState(() {
                                    isShuffle = value!;
                                  });
                                },
                              ),
                              Text('shuffle'),
                              SizedBox(width: 16),
                              Checkbox(
                                value: isTournament,
                                onChanged: (value) {
                                  setState(() {
                                    isTournament = value!;
                                  });
                                },
                              ),
                              Text('Tournament'),
                            ],
                          ),
                          ...getplayerblocstate.players!.entries
                              .expand((entry) {
                            print("the entry is $entry");

                            // Check if the value is a List (like your lstregplayer)
                            if (entry.value is List) {
                              playersList = entry.value as List;
                              print("the list of players is $playersList");

                              return playersList
                                  .asMap()
                                  .entries
                                  .map((playerEntry) {
                                int playerIndex = playerEntry.key;
                                Map<String, dynamic> player = playerEntry.value;

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: TextEditingController(
                                            text: player['FullName']
                                                    ?.toString() ??
                                                '', // or use ShortName, etc.
                                          ),
                                          onChanged: (val) {
                                            // Update the specific player's name
                                            // You might want to update the state here
                                            setState(() {
                                              player['FullName'] = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Player name',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {
                                            playersList.removeAt(playerIndex);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                            } else {
                              // Handle case where entry.value is not a List
                              return [Container()]; // or return empty list []
                            }
                          }).toList(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    // Add new player to the players map
                                    if (getplayerblocstate.players != null) {
                                      addNewPlayer(getplayerblocstate.players!);
                                    }
                                  });
                                },
                                child: Text('Add player'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: isValidCount
                                    ? () {
                                        print('Saving $totalPlayers players');
                                        print("the listdata is ${playersList}");
                                        //TODO : add loading state

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Row(
                                              children: [
                                                CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(Colors.blue),
                                                ),
                                                SizedBox(width: 16),
                                                Text('Creating pairs...'),
                                              ],
                                            ),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );

                                        BlocProvider.of<GetplayerBloc>(context)
                                            .add(GetplayerEvent.playerShuffle(
                                                data: playersList));

                                        //todo call the bloc and pass this players
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      isValidCount ? Colors.green : Colors.grey,
                                ),
                                child: Text('Save players'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
