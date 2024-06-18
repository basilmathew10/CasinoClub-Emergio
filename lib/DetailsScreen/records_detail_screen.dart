import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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


class RecordDetailScreen extends StatefulWidget {
  const RecordDetailScreen({super.key});

  @override
  State<RecordDetailScreen> createState() => _RecordDetailScreenState();
}

class _RecordDetailScreenState extends State<RecordDetailScreen> {
    var date= 'Syam_ak';
  var name= 'Syam AK';
  var game= 'Poker';
  var startpoint= '100';
  var bet= '500.00';
  var won= '2';
 var endpoint= '380';
  var drawtime= '1 hour';
   var status= 'Active';

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
            
                SizedBox(
                  height: 520,
                  child: Column(
                    children: [
                      Flexible(
                        child: StaggeredGridView.countBuilder(
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
                        color:  Colors.grey,
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
              _buildDetailRow(Icons.person, 'Date', date),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.money, 'Games    ',game),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.type_specimen, 'Startpoint     ',startpoint ),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.credit_score, 'Bet         ', bet),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.credit_score, 'Won         ', won),
              const SizedBox(height: 16.0),
              _buildDetailRow(Icons.credit_score, 'Endpoint      ', endpoint),
              const SizedBox(height: 16.0),
                _buildDetailRow(Icons.credit_score, 'Drawtime   ', drawtime),
              const SizedBox(height: 16.0),   
              _buildDetailRow(Icons.credit_score, 'Status       ', status),
              const SizedBox(height: 16.0),                                                                         
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