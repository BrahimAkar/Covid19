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
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Questv'),
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
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          color: Colors.deepOrange),
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                        top: -109,
                                        left: 5,
                                        child: Image.asset(
                                          'assets/images/doctor.png',
                                          width: 150,
                                          height: 450,
                                        ))
                                  ],
                                )),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'كل مايجب ان تعرفه \n لتحمي نفسك من \n فيروس كورونا',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontFamily: 'Questv',
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    onPressed: () => {},
                                    child: Text(
                                      'قراءة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Questv', fontSize: 18),
                                    ),
                                    color: Colors.white,
                                    textColor: Colors.deepOrange,
                                    padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    // MiddleCard
                    MiddleCard(),

                    SizedBox(
                      height: 25,
                    ),

                    // BottomCard

                    ButtomCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
