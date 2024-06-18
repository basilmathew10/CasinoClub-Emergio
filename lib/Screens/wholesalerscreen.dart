import 'dart:async';

import 'package:casino/Constants/constants.dart';
import 'package:flutter/material.dart';

class Wholesaler {
  String username;
  String name;
  String revenue;
  String type;
  String credit;
  String game;

  Wholesaler({
    required this.username,
    required this.name,
    required this.revenue,
    required this.type,
    required this.credit,
    required this.game,
  });
}

class Retailer {
  String username;
  String name;
  String revenue;
  String type;
  String credit;
  String game;

  Retailer({
   required this.username,
    required this.name,
    required this.revenue,
    required this.type,
    required this.credit,
    required this.game,
  });
}

class WholesalerScreen extends StatefulWidget {
  const WholesalerScreen({super.key});

  @override
  State<WholesalerScreen> createState() => _WholesalerScreenState();
}

class _WholesalerScreenState extends State<WholesalerScreen> {
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

 void _editRetailer(int index) {
    final TextEditingController nameController = TextEditingController(text: retailers[index].name);
    final TextEditingController usernameController = TextEditingController(text: retailers[index].username);
    final TextEditingController revenueController = TextEditingController(text: retailers[index].revenue.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Retailer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: revenueController,
                decoration: const InputDecoration(labelText: 'Revenue'),
                keyboardType: TextInputType.number,
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
                  retailers[index].name = nameController.text;
                  retailers[index].username = usernameController.text;
                  retailers[index].revenue = revenueController.text;
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

  List<Wholesaler> wholesalers = [
    Wholesaler(
      username: 'arun_10',
      name: 'Arun',
      revenue: '7.0',
      type: 'RV',
      credit: '890.00',
      game: 'Poker',
    ),
    Wholesaler(
      username: 'john_doe',
      name: 'John Doe',
      revenue: '5.5',
      type: 'RV',
      credit: '1200.00',
      game: 'Blackjack',
    ),
    // Add more wholesalers as needed
  ];

    final List<Retailer> retailers = [
    Retailer( 
      username: 'vy_shak',
      name: 'Vyshak',
      revenue: '4.00',
      type: 'AK',
      credit: '42643.00',
      game: 'Poker'
      ),
    Retailer( 
      username: 'sai_k',
      name: 'SaiKrishna',
      revenue: '2.8',
      type: 'RV',
      credit: '12050.00',
      game: 'Blackjack'
      ),
     Retailer( 
      username: 'b4zl_jr',
      name: 'Basil ',
      revenue: '3.6',
      type: 'Aj',
      credit: '40037.00',
      game: 'Baccarat'
      ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController =
        TextEditingController(text: wholesalers[currentIndex].username);
    final TextEditingController nameController =
        TextEditingController(text: wholesalers[currentIndex].name);
    final TextEditingController revenueController =
        TextEditingController(text: wholesalers[currentIndex].revenue);
    final TextEditingController typeController =
        TextEditingController(text: wholesalers[currentIndex].type);
    final TextEditingController creditController =
        TextEditingController(text: wholesalers[currentIndex].credit);
    final TextEditingController gameController =
        TextEditingController(text: wholesalers[currentIndex].game);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Wholesaler Details',
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
                      text: "WHOLESALER++",
                    ),
                ),
                  const SizedBox(height: 15),
                if (_isProfileVisible)
                  SizedBox(
                    height: 520,
                    child: Column(
                      children: [
                        Flexible(
                          child: PageView.builder(
                            itemCount: wholesalers.length,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          itemBuilder: (context, index) {
                            Wholesaler wholesaler = wholesalers[index];
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
                                                  AssetImage('assets/images/img4.jpg'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          wholesaler.name,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      _buildDetailRow(Icons.person, 'Username', wholesaler.username),
                                      const SizedBox(height: 16.0),
                                      _buildDetailRow(Icons.attach_money, 'Revenue   ', wholesaler.revenue),
                                      const SizedBox(height: 16.0),
                                      _buildDetailRow(Icons.type_specimen, 'Type         ', wholesaler.type),
                                      const SizedBox(height: 16.0),
                                      _buildDetailRow(Icons.credit_score, 'Credit       ', wholesaler.credit),
                                      const SizedBox(height: 16.0),
                                      _buildDetailRow(Icons.gamepad, 'Games     ', wholesaler.game),
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
                                                    wholesalers[currentIndex].username = usernameController.text;
                                                    wholesalers[currentIndex].name = nameController.text;
                                                    wholesalers[currentIndex].revenue = revenueController.text;
                                                    wholesalers[currentIndex].type = typeController.text;
                                                    wholesalers[currentIndex].credit = creditController.text;
                                                    wholesalers[currentIndex].game = gameController.text;
                      
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
                          'CREDIT : 890',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                         Divider(height: 5,),
                       Text(
                          'Total Retailers : 3',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Total Players : 0',
                          style: TextStyle(fontSize: 20,color: Colors.white),
                        ),
                        Text(
                          'Joined : 5',
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
                         Divider(height: 5,),
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
                         Text(
                          'Retailer point : 372',
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
                         Divider(height: 5,),
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
                        Text(
                          'Retailer point : 499 ',
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
                                                    'List of Retailers',
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
        itemCount: retailers.length,
        itemBuilder: (BuildContext context, int index) {
          final retailer = retailers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the retailer's detailed screen
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
                                    backgroundImage: AssetImage('assets/images/img1.jpg'),
                                  ),
                                  Text(
                                    ' ${retailer.name}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.black),
                                    onPressed: () {
                                      _editRetailer(index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.black),
                                    onPressed: () {
                                      setState(() {
                                        retailers.removeAt(index);
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
                      'Username: ${retailer.username}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Revenue: \$${retailer.revenue}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
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
            width: 185,
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