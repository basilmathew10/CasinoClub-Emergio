import 'dart:async';

import 'package:casino/Constants/constants.dart';
import 'package:casino/Screens/player_records.dart';
import 'package:flutter/material.dart';

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
  });
}
class PlayerR {
  String date;
  String name;
  String game;
  String startpoint;
  String bet;
  String won;
  String endpoint;
  String drawtime;
  String status;

  PlayerR({
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

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
    final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    });
  }

 void _editPlayer(int index) {
    final TextEditingController nameController = TextEditingController(text: playerrs[index].name);
    final TextEditingController gameController = TextEditingController(text: playerrs[index].game);
    final TextEditingController statusController = TextEditingController(text: playerrs[index].status);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Player'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: gameController,
                decoration: const InputDecoration(labelText: 'Game'),
              ),
              TextField(
                controller: statusController,
                decoration: const InputDecoration(labelText: 'Status'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  playerrs[index].name = nameController.text;
                  playerrs[index].game = gameController.text;
                  playerrs[index].status = statusController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _isProfileVisible = false;
  bool _isEditing = false;

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
      game: 'Poker'
      ),
    Player( 
      username: 'jane_smith',
      name: 'Jane Smith',
                wholesaler: 'John Doe', 
      retailer: 'Vyshak',
            operator: 'Peter Parker',
      revenue: '2.8',
      type: 'RV',
      credit: '12050.00',
      game: 'Blackjack'
      ),
     Player( 
      username: 'will_jacks',
      name: 'Will Jacks ',
                wholesaler: 'arun10', 
      retailer: 'Emil',
            operator: 'Kiran',
      revenue: '3.6',
      type: 'Aj',
      credit: '40037.00',
      game: 'Baccarat'
      ),
  ];

 List<PlayerR> playerrs = [
    PlayerR(
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
 PlayerR(
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
 PlayerR(
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
 PlayerR(
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
 PlayerR(
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
 PlayerR(
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
 PlayerR(
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
 PlayerR(
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController =
        TextEditingController(text: players[currentIndex].username);
    final TextEditingController nameController =
        TextEditingController(text: players[currentIndex].name);
    final TextEditingController revenueController =
        TextEditingController(text: players[currentIndex].revenue);
    final TextEditingController typeController =
        TextEditingController(text: players[currentIndex].type);
    final TextEditingController creditController =
        TextEditingController(text: players[currentIndex].credit);
    final TextEditingController gameController =
        TextEditingController(text: players[currentIndex].game);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Player Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: PulsatingRectButton(
                      onTap: () {
                        setState(() {
                          _isProfileVisible = !_isProfileVisible;
                        });
                      },
                      text: "PLAYER++",
                    ),
              ),
              if (_isProfileVisible)
                SizedBox(
                  height: 520,
                  child: Column(
                    children: [
                      Flexible(
                        child: PageView.builder(
                          itemCount: players.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
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
                                child: SingleChildScrollView(
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
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.person, 'Wholesaler', player.wholesaler), // Changed to store icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.group, 'Retailer', player.retailer), // Changed to store_mall_directory icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.build, 'Operator', player.operator), // Changed to build icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.attach_money, 'Revenue', player.revenue), // Changed to attach_money icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.category, 'Type', player.type), // Changed to category icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.credit_score, 'Credit', player.credit), // Kept credit_score icon
                                    const SizedBox(height: 16.0),
                                    _buildDetailRow(Icons.sports_esports, 'Games', player.game), // Changed to sports_esports icon

                                     ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _isEditing = !_isEditing;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 2.0), // Add some space between the text and the icon
                                            Icon(
                                              Icons.edit_square, // Replace with your desired icon
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 5,),
                                      const Divider(height: 5,),
                                      if (_isEditing)
                                        Container(
                                          margin: const EdgeInsets.all(16.0),
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            children: [
                                              _buildEditableDetailRow(Icons.person, 'Username', usernameController),
                                              const SizedBox(height: 16.0),
                                              _buildEditableDetailRow(Icons.account_circle, 'Name       ', nameController),
                                              const SizedBox(height: 16.0),
                                              _buildEditableDetailRow(Icons.money, 'Revenue  ', revenueController),
                                              const SizedBox(height: 16.0),
                                              _buildEditableDetailRow(Icons.type_specimen, 'Type         ', typeController),
                                              const SizedBox(height: 16.0),
                                              _buildEditableDetailRow(Icons.credit_score, 'Credit       ', creditController),
                                              const SizedBox(height: 16.0),
                                              _buildEditableDetailRow(Icons.gamepad, 'Games      ', gameController),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    players[currentIndex].username = usernameController.text;
                                                    players[currentIndex].name = nameController.text;
                                                    players[currentIndex].revenue = revenueController.text;
                                                    players[currentIndex].type = typeController.text;
                                                    players[currentIndex].credit = creditController.text;
                                                    players[currentIndex].game = gameController.text;
                      
                                                    _isEditing = false;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                ),
                                                child: const Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
      height: 200,
      width: 300,
      child: Column(
        children: [
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return  Card(
                    color: Colors.white,
                    child:  Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/pic2.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                        const Column(
                          children: [
                             Text(
                          'CREDIT : 1165',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                         Divider(height: 10,),
                      
                        Text(
                          'Last Login : 3',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Joined : ',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                         Text(
                          'Total : 50',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        ],
                        ),
                      ],
                    ),
                  );
                } else if (index == 1) {
                  return   Card(
                    color: Colors.white,
                    child:  Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/pic2.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                        const Column(
                          children: [
                             Text(
                          'This Week',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                         Divider(height: 10,),
                       Text(
                          'Played : 465',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Won : 950',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Endpoint : 485 ',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                         
                        ],
                        ),
                      ],
                    ),
                  );
                } else if (index == 2) {
                  return   Card(
                    color: Colors.white,
                    child:  Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/pic2.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                        const Column(
                          children: [
                             Text(
                          'Last Week',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                         Divider(height: 10,),
                       Text(
                          'Played : 6243',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Won : 5917',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Endpoint : 326',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                       
                        ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(); // Should not happen as itemCount is 3
                }
              },
            ),
          ),
        ],
      ),
    ),
                  Align(
            alignment: Alignment.centerLeft,
            child: Container(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            ' Player Records',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
          ),
        ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: playerrs.length,
        itemBuilder: (BuildContext context, int index) {
          final playerr = playerrs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayerRecords()),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage('assets/images/img7.jpg'),
                                  ),
                                  Text(
                                    ' ${playerr.name}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.black),
                                    onPressed: () {
                                      _editPlayer(index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.black),
                                    onPressed: () {
                                      setState(() {
                                        playerrs.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Games: ${playerr.game}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Status   : ${playerr.status}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    // Text(
                    //   'Type: ${retailer.type}',
                    //   style: const TextStyle(fontSize: 16, color: Colors.black),
                    // ),
                    // Text(
                    //   'Credit: ${retailer.credit}',
                    //   style: const TextStyle(fontSize: 16, color: Colors.black),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
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

  Widget _buildEditableDetailRow(IconData icon, String label, TextEditingController controller) {
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
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              hintStyle: const TextStyle(color: Colors.black),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class PulsatingRectButton extends StatefulWidget {
  const PulsatingRectButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  _PulsatingRectButtonState createState() => _PulsatingRectButtonState();
}

class _PulsatingRectButtonState extends State<PulsatingRectButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds:500));
    _animation = Tween(begin: 0.0, end: 10.0).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return SizedBox(
            width: 140,
            child: Ink(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),  // Added border radius for smooth corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(_animationController.value / 2),
                    spreadRadius: _animation.value,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


