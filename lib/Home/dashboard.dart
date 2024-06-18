import 'package:casino/fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
     
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildSquareCard('0', 'PlayPoint'),
                  _buildSquareCard1('0', 'ViewPoint'),
                  _buildSquareCard2('0', 'EndPoints'),
                ],
              ),
            ),
             Align(
              alignment: Alignment.centerLeft,
               child: Container(
                           padding: const EdgeInsets.all(16),
                           child: const Text(
                'Win was endpoint by monthly',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                           ),
                         ),
             ),
          const Center(child: SimpleResponsiveGraph()),
const SizedBox(height: 20,),
       Row(
  children: [
Container(
  padding: const EdgeInsets.all(8.0),
  margin: const EdgeInsets.all(8.0),
  alignment: Alignment.center,
 decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/statistics.jpg'), // Specify your image path
          fit: BoxFit.cover,
        ),
      ),
  width: 190.0, // Adjust width as needed
  height: 190.0, // Make it a square shape
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
        children: [
          Text(
            'Games',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 40), // Adjust spacing between texts
          Text(
            'EndPoint',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      
    ],
  ),
),


    const SizedBox(width: 6,),
    Container(
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
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
    children: [
      const Text(
        'Game Platforms',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8), // Adjust spacing between texts
      const Text(
        'Online',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(height: 8), // Adjust spacing between text and rectangles
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
  width: 175,
  height: 40,
  color: Colors.white,
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.android, // Use your desired icon here
        color: Colors.black,
        size: 20.0, // Adjust the size of the icon as needed
      ),
      SizedBox(width: 140), // Add some space between the icon and text
      Text(
        '0',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

        

          const SizedBox(height: 8,),
          Container(
  width: 175,
  height: 40,
  color: Colors.white,
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        Icons.window_sharp, // Use your desired icon here
        color: Colors.black,
        size: 20.0, // Adjust the size of the icon as needed
      ),
      Text(
        '1',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),


        ],
      ),
    ],
  ),
),

  ],
),
Container(
  padding: const EdgeInsets.all(8.0),
  margin: const EdgeInsets.all(8.0),
  alignment: Alignment.center,
 decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/pie1.png'), // Specify your image path
          fit: BoxFit.cover,
        ),
      ),
  width: 400.0, // Adjust width as needed
  height: 300.0, // Make it a square shape
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the texts horizontally
        children: [
          Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 40), // Adjust spacing between texts
          Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      
    ],
  ),
),
// Container(
//   width: 320.0, // Adjust width as needed
//   height: 320.0, // Make it a square shape
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       image: AssetImage('assets/images/background.jpg'), // Provide the path to your image
//       fit: BoxFit.cover,
//     ),
//   ),
//   child: const Column(
//     mainAxisAlignment: MainAxisAlignment.start, // Align text to the top
//     children: [],
//   ),
// ),
          ],
        ),
      ),
    );
  }

Widget _buildSquareCard(String number, String description) {
  return Card(
    color: Colors.transparent, // Make the card background transparent
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/pic1.jpg'), // Specify your image path
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              number,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _buildSquareCard1(String number, String description) {
  return Card(
    color: Colors.transparent, // Make the card background transparent
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/pic3.jpg'), // Specify your image path
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              number,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _buildSquareCard2(String number, String description) {
  return Card(
    color: Colors.transparent, // Make the card background transparent
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/pic4.jpg'), // Specify your image path
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              number,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white, // Change font color to contrast with the image
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


}