import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          SizedBox(height: 100.0),
          Container(
            width: 200.0, // Adjust the width as needed
            height: 200.0, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              // Adjust the border radius for rounded edges
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30.0),
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
