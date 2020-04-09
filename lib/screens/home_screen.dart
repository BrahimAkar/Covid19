import 'package:flutter/material.dart';
import 'package:imback/widgets/raisedButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF243953),
        leading: IconButton(
          onPressed: () => {},
          icon: Icon(Icons.search),
        ),
        title: Center(
          child: Text(
            'توعية',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0XFF243953),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.deepOrange,
                height: 210,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    spacing: 28.0, // gap between adjacent chips
                    runSpacing: 20, // gap between lines
                    direction: Axis.horizontal, // main axis (rows or columns)
                    children: <Widget>[
                      RaisedButtonHome('التدابير الوقائية'),
                      RaisedButtonHome('التضامن'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    spacing: 28.0, // gap between adjacent chips
                    runSpacing: 20, // gap between lines
                    direction: Axis.horizontal, // main axis (rows or columns)
                    children: <Widget>[
                        RaisedButtonHome('التنبيه التلقائي'),
                       RaisedButtonHome('أرقام الطوارئ'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
