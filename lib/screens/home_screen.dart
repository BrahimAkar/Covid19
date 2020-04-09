import 'package:flutter/material.dart';
import 'package:imback/widgets/bottomCard.dart';
import 'package:imback/widgets/middleCard.dart';
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
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Container(
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

            // MiddleCard
            MiddleCard(),

            SizedBox(
              height: 33,
            ),

            // BottomCard

            ButtomCard(),
          ],
        ),
      ),
    );
  }
}
