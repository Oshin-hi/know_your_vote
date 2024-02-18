import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'view_candidates.dart';

final List<Candidate> candidates = [
  Candidate('Balen Shah', 'assets/candidate1.jpg', "120", "Independent"),
  Candidate('Srijana Singh', 'assets/candidate2.jpg', "110", "Nepali Congress"),
  Candidate('Samikshya Baskota', 'assets/candidate3.jpg',"90", "Bibeksheel Sajha"),
  Candidate('Keshav Sthapit', 'assets/candidate4.jpg',"80", "CPN UML"),
  Candidate('Suman Sayami', 'assets/candidate5.jpg',"60", "CPN UML"),
  Candidate('Keshav Singh', 'assets/candidate6.jpg',"60", "CSN"),
  Candidate('Keshav Soni', 'assets/candidate7.jpg', "58", "MPN"),
  Candidate('Keshav po', 'assets/candidate8.jpg', "55", "BSP"),
];



class Vote_Count extends StatefulWidget {
  @override
  State<Vote_Count> createState() => _Vote_CountState();
}


class _Vote_CountState extends State<Vote_Count> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Vote Counting Results in your area",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: ListView.builder(
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        return CandidateCard(candidate: candidates[index]);
      },
    ),);
  }
}

class CandidateCard extends StatelessWidget {
  final Candidate candidate;

  CandidateCard({required this.candidate});

  get index => index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(candidate.image_url),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candidate.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0), // Add some spacing between the texts
            Container(
              color: Colors.red[800],

              width: (double.parse(candidate.votes)*2),
              child: Text(
                ' ${candidate.party}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
            ),

        );



  }
}


class Candidate {
  late String name;
  late String image_url;
  late String votes;
  late String party;


  Candidate(this.name, this.image_url,  this.votes, this.party) ;


}

