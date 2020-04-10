import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imback/consts.dart';

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

  changeMapMode() {
    getJsonFile('assets/dark.json').then(setMapStyle);
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
      appBar: AppBar(
        backgroundColor: ColorsApp.mainColor,
        leading: Icon(Icons.arrow_back_ios),
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
              isMapCreated = true;
              _controller = controller;
              getJsonFile('assets/dark.json').then(setMapStyle);
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 5.0,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 89,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.notifications_active),
                      Text('مدينة كلميم')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('بؤرة تفشي'),
                      Icon(
                        Icons.donut_large,
                        color: Colors.red,
                      ),
                      Text('جهة كلميم السمارة'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
