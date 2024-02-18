import 'package:flutter/material.dart';

class VotingDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "Nepal Election 2080 B.S.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: Container(
        height: 1000,
        width: 600,
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Election Announcement',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Date: Asar 5, 2075 B.S.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Time: 8:00 AM - 6:00 PM',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Basic Rules:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                RulePoint(text: 'Bring a valid ID to vote.'),
                RulePoint(text: 'Follow the designated voting hours.'),
                RulePoint(text: 'Respect the voting process and others.'),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/nirwachan1.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RulePoint extends StatelessWidget {
  final String text;

  RulePoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
