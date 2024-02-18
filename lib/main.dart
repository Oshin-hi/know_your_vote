

import 'package:election_nepal/pages/Home_screen.dart';
import 'package:election_nepal/pages/mapsample.dart';
import 'package:flutter/material.dart';
import 'package:election_nepal/pages/searchArea_map.dart';
import 'package:election_nepal/pages/view_candidates.dart';
import 'package:election_nepal/pages/vote_count.dart';
import 'package:election_nepal/pages/vote_dates.dart';
import 'package:election_nepal/pages/candidate_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


void main() => runApp(MaterialApp(
      initialRoute: "/Home_Screen",
      routes: {
        "/Home_Screen": (context) => HomeScreen(),
        "/searchArea_map": (context) => SearchArea(),
        "/view_candidates": (context) => Product(),
        "/vote_count": (context) => Vote_Count(),
        "/vote_dates": (context) => VotingDates(),
        "/candidate_page": (context) => CandidatePage(),
        "/mapsample": (context) => MapSample(),
      },
    ));
