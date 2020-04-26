import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF243953),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/lines.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 160),
                      Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Lottie.asset(
                          'assets/logomove.json',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Positioned(
                bottom: 66,
                right: 30,
                left: 30,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.height,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(15),
                        onPressed: () => {
                          Navigator.pushNamed(context, '/homescreen'),
                        },
                        child: Text(
                          'متابعة',
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontFamily: 'Questv'),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 95,
                right: 95,
                child: Container(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
