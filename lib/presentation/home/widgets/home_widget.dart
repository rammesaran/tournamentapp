import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isShuffle = true;
  bool isTournament = true;
  List<String> players = ['Sathish', '', ''];
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Game Play', style: Theme.of(context).textTheme.headline6),
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
            TextButton(
              onPressed: () {},
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
                    ...players.asMap().entries.map((entry) {
                      int idx = entry.key;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller:
                                    TextEditingController(text: entry.value),
                                onChanged: (val) {
                                  players[idx] = val;
                                },
                                decoration: InputDecoration(
                                  hintText: 'player name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  players.removeAt(idx);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              players.add('');
                            });
                          },
                          child: Text('Add player'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Save logic
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
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
      ),
    );
  }
}
