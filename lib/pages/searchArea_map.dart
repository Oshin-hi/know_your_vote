import 'package:election_nepal/pages/mapsample.dart';
import 'package:election_nepal/pages/view_candidates.dart';
import 'package:election_nepal/pages/vote_count.dart';
import 'package:flutter/material.dart';

class SearchArea extends StatefulWidget {
  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  int _currentIndex = 0;
  List<Widget> body = [
    MapSample(),
    Product(),
    Vote_Count(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),),
        BottomNavigationBarItem(
          label: "Candidates",
          icon: Icon(Icons.people),),
        BottomNavigationBarItem(
          label: "Votecount",
          icon: Icon(Icons.how_to_vote_outlined),),

      ],
    ),);
  }
}
