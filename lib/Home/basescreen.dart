import 'package:casino/Screens/adminscreen.dart';
import 'package:casino/Home/dashboard.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final today = DateTime.now();
// final fiftyDaysFromNow = today.add(const Duration(days: 50));
    int _selectedIndex = 0;
 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 static  final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const AdminScreen(username: '', name: '', password: '',),
    // const Dashboard(),
    // const Dashboard(),
    // const Dashboard(),
    // const Dashboard(),
  ];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          // title: Text(today.toString()),
      leadingWidth: 105,
      backgroundColor: Colors.black,
      leading: Image.asset("assets/images/casino1_bg.png",
      fit:BoxFit.cover,
      
      ),
    ),

      body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),

        
      ),
         bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          items: const [
          BottomNavigationBarItem( 
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_3_sharp),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_4_outlined),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group_sharp),
          //   label: '',
          // ),
          //  BottomNavigationBarItem(
          //   icon: Icon(Icons.groups),
          //   label: '',
            
          // ),
        ],
        currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }
       ),
    );
  }
}
