import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imback/consts.dart';
import 'package:imback/widgets/mapCard.dart';

class MapLive extends StatefulWidget {
  @override
  _MapLiveState createState() => _MapLiveState();
}

class _MapLiveState extends State<MapLive> {
  GoogleMapController mapController;

  GoogleMapController _controller;
  bool isMapCreated = false;
  final LatLng _center = const LatLng(28.98696, -10.05738);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text('تحديثات مباشرة')),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: Stack(
        
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              //      isMapCreated = true;
              _controller = controller;
              getJsonFile('assets/dark.json').then(setMapStyle);
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 5.0,
            ),
          ),
          MapCard(),
        ],
      ),
    );
  }
}
