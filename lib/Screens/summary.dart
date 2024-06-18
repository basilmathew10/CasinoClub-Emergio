import 'package:casino/Constants/constants.dart';
import 'package:flutter/material.dart';
class Summary {
  String username;
  String name;
    String wholesaler;
  String retailer;
  String operator;
  String revenue;
  String type;
  String winpoints;
  String game;

  Summary({
   required this.username,
    required this.name,
        required this.wholesaler,
    required this.retailer,
    required this.operator,    
    required this.revenue,
    required this.type,
    required this.winpoints,
    required this.game,
  });
}
class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
    final List<Summary> summarys = [
    Summary( 
      username: 'syam_ak',
      name: 'Syam AK',
           wholesaler: 'arun10', 
      retailer: 'Basil',
            operator: 'Geevees',
      revenue: '4.00',
      type: 'AK',
      winpoints: '42643.00',
      game: 'Poker'
      ),
    Summary( 
      username: 'jane_smith',
      name: 'Jane Smith',
                wholesaler: 'John Doe', 
      retailer: 'Vyshak',
            operator: 'Peter Parker',
      revenue: '2.8',
      type: 'RV',
      winpoints: '12050.00',
      game: 'Blackjack'
      ),
     Summary( 
      username: 'will_jacks',
      name: 'Will Jacks ',
                wholesaler: 'arun10', 
      retailer: 'Emil',
            operator: 'Kiran',
      revenue: '3.6',
      type: 'Aj',
      winpoints: '40037.00',
      game: 'Baccarat'
      ),
  ];

    int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: SafeArea(
  child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Last Month"),
                              ),
                              const SizedBox(width: 130,),
       ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Current Month"),
                              ),
  
        ],
      ),
                                  const SizedBox(height: 15,),
  
      Row(
        children: [
          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Last 6 Month"),
                              ),
                                                          const SizedBox(width: 140,),
  
       ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Last Week"),
                              ),
  
        ],
      ),
                                      const SizedBox(height: 15,),
  
      Row(
        children: [
          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Current Week"),
                              ),
                                                          const SizedBox(width: 165,),
  
       ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Today"),
                              ),
  
        ],
      ),
                                      const SizedBox(height: 15,),
  
      Row(
        children: [
          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Yesterday"),
                              ),
                                                          const SizedBox(width: 160,),
  
       ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 36, 53, 177),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                onPressed: () async {
                                 
                                },
                                child: const Text("Date Range"),
                              ),
  
        ],
      ),
      SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      Flexible(
                        child: PageView.builder(
                          itemCount: summarys.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            Summary summary = summarys[index];
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
                                          summary.name,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                  _buildDetailRow(Icons.games, 'Games', summary.game),
                  const SizedBox(height: 10.0),
                  _buildDetailRow(Icons.star_outline_sharp, 'Winpoints', summary.winpoints),

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
    ],
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