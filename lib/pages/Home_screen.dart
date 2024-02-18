import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "Election Nepal",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 370.0),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/searchArea_map");



                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                ),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                )),
          ),
          SizedBox(height: 8.0),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/vote_dates");



                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                ),
                child: Text(
                  "Check election dates",
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                )),
          ),

        ],
      ),
    );
  }
}
