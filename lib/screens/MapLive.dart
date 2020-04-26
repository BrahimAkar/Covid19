import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imback/widgets/mapCard.dart';
import 'package:imback/classes/Corona.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

Future<Corona> fetchCorona() async {
  final response = await http.get('https://api.covid19api.com/summary');

  if (response.statusCode == 200) {
    return Corona.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load the corona data');
  }
}

class MapLive extends StatefulWidget {
  @override
  _MapLiveState createState() => _MapLiveState();
}

class _MapLiveState extends State<MapLive> {
  Future<Corona> futureCorona;
  GoogleMapController mapController;

  GoogleMapController _controller;
  bool isMapCreated = false;
  final LatLng _center = const LatLng(28.98696, -10.05738);

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  // API

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  BitmapDescriptor myIcon;

  List<Marker> allMarkers = [];

  @override
  void initState() {
    futureCorona = fetchCorona();

    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(75, 75)), 'assets/images/markor2.png')
        .then((onValue) {
      myIcon = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios)),
          title: Center(
              child: Text(
            'تحديثات مباشرة',
            style: TextStyle(color: Theme.of(context).accentColor),
          )),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Icon(Icons.refresh),
            )
          ],
        ),
        // body: WebView(
        //   initialUrl: "https://www.bing.com/covid",
        //   javascriptMode: JavascriptMode.unrestricted,

        // ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                //      isMapCreated = true;
                _controller = controller;
                if (notifier.isDark == true) {
                  getJsonFile('assets/dark.json').then(setMapStyle);
                }

                setState(() {
                  allMarkers.add(Marker(
                      icon: myIcon,
                      markerId: MarkerId('guelmim'),
                      draggable: false,
                      onTap: () => print('marker taped'),
                      position: LatLng(28.9884, -10.05738)));
                  allMarkers.add(Marker(
                      icon: myIcon,
                      markerId: MarkerId('casablanca'),
                      draggable: false,
                      onTap: () => print('marker taped'),
                      position: LatLng(33.5731, -7.5898)));
                  allMarkers.add(Marker(
                      icon: myIcon,
                      markerId: MarkerId('rabat'),
                      draggable: false,
                      onTap: () => print('marker taped'),
                      position: LatLng(34.020882, -6.841650)));
                  allMarkers.add(Marker(
                      icon: myIcon,
                      markerId: MarkerId('laayoune'),
                      draggable: false,
                      onTap: () => print('marker taped'),
                      position: LatLng(27.125286, -13.162500)));
                  allMarkers.add(Marker(
                      icon: myIcon,
                      markerId: MarkerId('agadir'),
                      draggable: false,
                      onTap: () => print('marker taped'),
                      position: LatLng(30.4278, -9.5981)));
                });
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5.0,
              ),
              markers: Set.from(allMarkers),
            ),
            FutureBuilder(
                future: futureCorona,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return MapCard(
                        snapshot.data.recovered,
                        snapshot.data.deaths,
                        snapshot.data.totalCases,
                        snapshot.data.date);
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF1B2C41),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.yellow,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ],
        ),
      );
    });
  }
}
