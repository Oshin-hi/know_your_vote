import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:election_nepal/main.dart';

class CandidatePage extends StatefulWidget {


  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  List<Map<String, dynamic>> _listItem = [
    {
      "name": "Balen Shah",
      "party": "Independent",
      "ward": "3",
      "image": "assets/candidate1.jpg"
    },
    {
      "name": "Srijana Singh",
      "party": "Nepali Congress",
      "ward": "3",
      "image": "assets/candidate2.jpg"
    },
    {
      "name": "Samikshya Baskota",
      "party": "Bibeksheel Sajha",
      "ward": "1",
      "image": "assets/candidate3.jpg"
    },
    {
      "name": "Keshav Sthapit",
      "party": "CPN UML",
      "ward": "2",
      "image": "assets/candidate4.jpg"
    },
    {
      "name": "Suman Sayami",
      "party": "Independent",
      "ward": "2",
      "image": "assets/candidate5.jpg"
    },
  ];



@override
  Widget build(BuildContext context) {

  var candidate= _listItem[0];
  String name= candidate["name"];

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text("$name",),

      ),


    );
  }
}

