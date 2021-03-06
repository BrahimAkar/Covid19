import 'package:flutter/material.dart';

class AllImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: Text(
            'التدابير الوقائية',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          )),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: Color(0xff1b3b54),
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/clean15.jpg'), // 1
                      Image.asset('assets/getout.jpg'), // 2
                      Image.asset('assets/eat.jpg'), // 3
                      Image.asset('assets/clean.jpg'), //4
                      Image.asset('assets/sport.jpg'), // 5
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
