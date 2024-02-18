import 'dart:async';

import 'package:election_nepal/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';


class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController googleMapController;


  Set<Marker> markers = {};

  static const CameraPosition initialposition = CameraPosition(
    target: LatLng(13.764722, 100.538611),
    zoom: 14.4746,
  );

  static final Marker initialpositionMarker = Marker(
    markerId: MarkerId("_kGoogle Plex"),
    infoWindow: InfoWindow(title: "Google Plex"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Search nearby polling booths",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        children: [const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(


            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search for your constituency',

            ),
          ),
        ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: markers,
              initialCameraPosition: initialposition,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _goToCurrentLocation();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));

          markers.clear();
          markers.add( Marker(markerId: const MarkerId("currentLocation"), position: LatLng(position.latitude, position.longitude) ));
          setState(() {

          });
          },
        label: const Text('Go to Current Location'),
        icon: const Icon(Icons.directions_walk_outlined),
      ),
    );
  }

  Future<Position> _goToCurrentLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location service disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
