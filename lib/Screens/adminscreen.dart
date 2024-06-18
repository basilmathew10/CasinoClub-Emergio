import 'package:casino/Constants/constants.dart';
import 'package:casino/Screens/authentication.dart';
import 'package:casino/Screens/operatorscreen.dart';
import 'package:casino/Screens/playerscreen.dart';
import 'package:casino/Screens/retailerscreen.dart';
import 'package:casino/Screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'player_records.dart';
import 'summary.dart';
import 'wholesalerscreen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, 
  required final String username,
  required final String name,
  required final String password});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  var username= 'demo_admin';
  var name= 'Casino Demo Admin';
  var password= 'admin@1q2w3e';
  bool _isProfileVisible = false;
  bool _isEditing = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;
    _nameController.text = name;
    _passwordController.text = password;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
             Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Admin Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
                      const SizedBox(height: 5,),
         Column(
           children: [
            Align(
              alignment: Alignment.centerLeft,
              child: PulsatingRectButton(
                      onTap: () {
                        setState(() {
                          _isProfileVisible = !_isProfileVisible;
                        });
                      },
                      text: "ADMIN++",
                    ),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       _isProfileVisible = !_isProfileVisible;
              //     });
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.white, // Set the button color to blue
              //   ),
              //   child: const Text(
              //     'ADMIN++',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold
              //     ),
              //   ),
              // ),
            )
      
                            
           ],
         ),
            if (_isProfileVisible)
              StaggeredGridView.countBuilder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 1,
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
          backgroundImage: AssetImage('assets/images/img6.jpg'),
        ),
        ],
        ),
      ),
        const SizedBox(height: 8.0), // Optional: add some space between the avatar and the text
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
             name,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      
      
               const SizedBox(height: 16.0),
              _buildDetailRow(Icons.person, 'Username',username),
              // const SizedBox(height: 16.0),
              // _buildDetailRow(Icons.account_circle, 'Name', name),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.lock, 'Password',password ),
      
              ElevatedButton(
               onPressed: () {
                              setState(() {
                                _isEditing = !_isEditing;
                              });
                            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set the button color to blue
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
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
                                  _buildEditableDetailRow(
                                    Icons.person,
                                    'Username',
                                    _usernameController,
                                  ),
                                  const SizedBox(height: 16.0),
                                  _buildEditableDetailRow(
                                    Icons.account_circle,
                                    'Name       ',
                                    _nameController,
                                    
                                  ),
                                  const SizedBox(height: 16.0),
                                  _buildEditableDetailRow(
                                    Icons.lock,
                                    'Password',
                                    _passwordController,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        username = _usernameController.text;
                                        name = _nameController.text;
                                        password = _passwordController.text;
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
                  );
                },
              ),
             Row(
          children: [
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WholesalerScreen()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'WHOLESALER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
        
        const SizedBox(width: 10,),
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RetailerScreen()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'RETAILER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
          ],
        ),
        Row(
          children: [
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OperatorScreen()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'OPERATOR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
        
        const SizedBox(width: 10,),
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayerScreen()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'PLAYER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
          ],
        ),
        Row(
          children: [
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Authentication()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'AUTHENTICATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
        
        const SizedBox(width: 10,),
        GestureDetector(
           onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayerRecords()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'PLAYER RECORDS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
          ],
        ),
        Row(
          children: [
        GestureDetector(
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Transactions()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'TRANSACTIONS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
        
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const  SummaryScreen()),
              );
            },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
            ),
            width: 190.0, // Adjust width as needed
            height: 190.0, // Make it a square shape
            child: const Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align text to the top
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
                children: [
                  Text(
                    'SUMMARY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 
                ],
              ),
            ),
            
          ],
            ),
          ),
        ),
        
          ],
        ),
          ],
        ),
      ),
    );
  }



   Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, 
        color: Colors.black,
        size: 25,),
        const SizedBox(width: 16.0),
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:  Colors.black,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
             color:  Colors.black,
             fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEditableDetailRow(
    IconData icon,
    String label,
    TextEditingController controller,
  ) {
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
              labelText: label,
              hintStyle:  const TextStyle(color: Colors.black),
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
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
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
            width: 130,
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
