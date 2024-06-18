import 'package:flutter/material.dart';

import '../Constants/constants.dart';

enum RequestStatus {
  pending,
  approved,
  rejected,
}

class Player {
  String username;
  String name;
  String wholesaler;
  String retailer;
  String operator;
  String revenue;
  String type;
  String credit;
  String game;
  RequestStatus requestStatus; // Add this field

  Player({
    required this.username,
    required this.name,
    required this.wholesaler,
    required this.retailer,
    required this.operator,
    required this.revenue,
    required this.type,
    required this.credit,
    required this.game,
    required this.requestStatus, // Initialize this field
  });
}

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final List<Player> players = [
    Player(
      username: 'syam_ak',
      name: 'Syam AK',
      wholesaler: 'arun10',
      retailer: 'Basil',
      operator: 'Geevees',
      revenue: '4.00',
      type: 'AK',
      credit: '42643.00',
      game: 'Poker',
      requestStatus: RequestStatus.pending,
    ),
    // Add more players as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Login Requests',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 520,
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    Player player = players[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    // Use appropriate image for user
                                    backgroundImage:
                                        AssetImage('assets/images/img11.jpg'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                player.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            _buildDetailRow(Icons.person, 'Username', player.username),
                            // Add more detail rows as needed
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                            setState(() {
                              players.removeAt(index);
                            });
                          },
                                  child: const Text('Approve'),
                                ),
                                ElevatedButton(
                                 onPressed: () {
                            setState(() {
                              players.removeAt(index);
                            });
                          },
                                  child: const Text('Reject'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
        const SizedBox(width: 16.0),
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
