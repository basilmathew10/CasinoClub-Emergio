import 'package:casino/DetailsScreen/records_detail_screen.dart';
import 'package:flutter/material.dart';
class Player {
  String date;
  String name;
  String game;
  String startpoint;
  String bet;
  String won;
  String endpoint;
  String drawtime;
  String status;

  Player({
    required this.date,
    required this.name,
    required this.game,
    required this.startpoint,
    required this.bet,
    required this.won,
    required this.endpoint,
    required this.drawtime,
    required this.status,
  });
}

class PlayerRecords extends StatefulWidget {
  const PlayerRecords({super.key});

  @override
  State<PlayerRecords> createState() => _PlayerRecordsState();
}

class _PlayerRecordsState extends State<PlayerRecords> {
  List<Player> players = [
    Player(
      date: '2024-06-01',
      name: 'Syam AK',
      game: 'Poker',
      startpoint: '100',
      bet: '500.00',
      won: '2',
      endpoint: '380',
      drawtime: '10:00 AM',
      status: 'Active',
    ),
 Player(
      date: '2024-05-05',
      name: 'John Doe',
      game: 'Blackjack',
      startpoint: '20',
      bet: '190.00',
      won: '0',
      endpoint: '380',
      drawtime: '08:00 PM',
      status: 'InActive',
    ),
 Player(
      date: '2024-06-02',
      name: 'Jane Smith',
      game: 'Poker',
      startpoint: '45',
      bet: '2000.00',
      won: '2',
      endpoint: '380',
      drawtime: '10:00 AM',
      status: 'Active',
    ),
 Player(
      date: '2024-06-03',
      name: 'David Warner',
      game: 'Craps',
      startpoint: '80',
      bet: '1200.00',
      won: '3',
      endpoint: '470',
      drawtime: '7:00 am',
      status: 'Active',
    ),
 Player(
      date: '2024-06-04',
      name: 'Rajat Patidar',
      game: 'Tables game',
      startpoint: '28',
      bet: '5000.00',
      won: '5',
      endpoint: '700',
      drawtime: '9:00 AM',
      status: 'Active',
    ),
 Player(
      date: '2024-06-05',
      name: 'Rooney',
      game: 'Baccarat',
      startpoint: '100',
      bet: '4000.00',
      won: '6',
      endpoint: '1000',
      drawtime: '12:00 AM',
      status: 'Active',
    ),
 Player(
      date: '2024-06-07',
      name: 'Mahipal Lomror',
      game: 'Bingo',
      startpoint: '50',
      bet: '7000.00',
      won: '2',
      endpoint: '5400',
      drawtime: '1:00 PM',
      status: 'Active',
    ),
 Player(
      date: '2024-06-06',
      name: 'Will Jacks',
      game: 'Spanish 21',
      startpoint: '50',
      bet: '1000.00',
      won: '6',
      endpoint: '638',
      drawtime: '4 hour',
      status: 'Active',
    ),
    ];

  String selectedDate = '';
  String? selectedName;
  String? selectedGame;

  List<String> names = ['Syam AK', 'John Doe', 'Jane Smith', 'David Warner', 'Will Jacks','Rajat Patidar','Rooney','Mahipal Lomror' ]; // Add more names
  List<String> games = ['Poker', 'Blackjack', 'Roulette','Baccarat','Craps', 'Tables game','Spanish 21','Bingo']; // Add more games

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
                  'Player Records',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildDropdown('Name', selectedName, names, (value) {
                      setState(() {
                        selectedName = value;
                      });
                    }),
                    const SizedBox(height: 16.0),
                    _buildDropdown('Game', selectedGame, games, (value) {
                      setState(() {
                        selectedGame = value;
                      });
                    }),
                    const SizedBox(height: 16.0),
                    _buildDatePicker(context),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Trigger rebuild to display filtered results
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              _buildPlayerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text('Select $label'),
            isExpanded: true,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Date: ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate.toString().split(' ')[0]; // Format as yyyy-MM-dd
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                selectedDate.isEmpty ? 'Select Date' : selectedDate,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

   Widget _buildPlayerList() {
    List<Player> filteredPlayers = players.where((player) {
      bool matchesName = selectedName == null || player.name == selectedName;
      bool matchesGame = selectedGame == null || player.game == selectedGame;
      bool matchesDate = selectedDate.isEmpty || player.date == selectedDate;
      return matchesName && matchesGame && matchesDate;
    }).toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredPlayers.length,
      itemBuilder: (context, index) {
        Player player = filteredPlayers[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecordDetailScreen()),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/img1.jpg'),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            player.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            // Edit action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              players.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildDetailRow(Icons.games, 'Games', player.game),
                  const SizedBox(height: 10.0),
                  _buildDetailRow(Icons.star_outline_sharp, 'Status', player.status),
                ],
              ),
            ),
          ),
        );
      },
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
