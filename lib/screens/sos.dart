import 'dart:convert';

import 'package:covid19/localization/localization_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sos extends StatefulWidget {
  @override
  _SosState createState() => _SosState();
}

class _SosState extends State<Sos> {
  List<String> textTitle = [
    "Allo SAMU",
    "Allo Yakada",
    "Ministère de l Intérieur et les forces armées royales"
  ];
  List<String> textNumber = ["141", "080 100 47 47", "300"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          getTranslated(context, "emergency"),
          style: TextStyle(fontSize: 18, color: Theme.of(context).accentColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        color: Theme.of(context).scaffoldBackgroundColor,
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
              SosCard(textTitle[0], textNumber[0]),
              SosCard(textTitle[1], textNumber[1]),
              SosCard(textTitle[2], textNumber[2]),
            ],
          ),
        ),
      ),
    );
  }
}

class SosCard extends StatelessWidget {
  final String textTitle;
  final String textNumber;
  SosCard(this.textTitle, this.textNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Color(0xffe44e4f)),
        child: ListTile(
          contentPadding:
              EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
          title: Text(
            textTitle,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            textNumber,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'RalewayMedium',
              color: Colors.white,
            ),
          ),
          trailing: Container(
            width: 55,
            height: 55,
            child: FlatButton(
              onPressed: () {
                launch("tel:$textNumber");
              },
              child: Icon(
                Icons.phone,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
