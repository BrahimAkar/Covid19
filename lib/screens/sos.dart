import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sos extends StatefulWidget {
  @override
  _SosState createState() => _SosState();
}

class _SosState extends State<Sos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Text(
            'أرقام الطوارئ      ',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        color: Color(0xFF243953),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Center(child: Image.asset('assets/images/soslogo.png')),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(left: 15, right: 15, top: 10),
                    title: Text(
                      'Allo SAMU',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '141',
                      style:
                          TextStyle(fontSize: 18, fontFamily: 'RalewayMedium'),
                    ),
                    trailing: Container(
                      width: 55,
                      height: 55,
                      child: FlatButton(
                        onPressed: () {
                          launch("tel:141");
                        },
                        child: Icon(
                          Icons.phone,
                          size: 32,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(left: 15, right: 15, top: 10),
                    title: Text(
                      'Allo Yakada',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '080 100 47 47',
                      style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                    ),
                    trailing: Container(
                      width: 55,
                      height: 55,
                      child: FlatButton(
                        onPressed: () {
                          launch("tel:0801004747");
                        },
                        child: Icon(
                          Icons.phone,
                          size: 32,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(left: 15, right: 15, top: 10),
                    title: Text(
                      'Ministère de l Intérieur et les forces armées royales',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '300\n',
                      style: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          child: FlatButton(
                            onPressed: () {
                              launch("tel:300");
                            },
                            child: Icon(
                              Icons.phone,
                              size: 32,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
