import 'package:flutter/material.dart';
import 'package:imback/widgets/bottomCard.dart';
import 'package:imback/widgets/middleCard.dart';
import 'package:imback/widgets/raisedButton.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle textStyle = TextStyle(
    color: Colors.white,
  );

  String search =
      "https://play.google.com/store/search?q=com.sensibilisation19.app&c=apps&hl=en";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height,
              child: Drawer(
                elevation: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        color: Color(0xFF243943),
                        child: CircleAvatar(
                          child: Image.asset('assets/images/0.png'),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: Material(
                          color: Color(0xFF243953),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 35),
                              ListTile(
                                title: Text(
                                  'تقييم التطبيق',
                                  style: textStyle,
                                ),
                                trailing: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                onTap: () => {
                                  launch(search),
                                },
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                title: Text(
                                  'مزيد من التطبيقات',
                                  style: textStyle,
                                ),
                                onTap: () => {
                                  launch(search),
                                },
                                trailing: Icon(
                                  Icons.apps,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                title: Text(
                                  'الإبلاغ عن مشكلة',
                                  style: textStyle,
                                ),
                                onTap: () => {
                                  launch(search),
                                },
                                trailing: Icon(
                                  Icons.bug_report,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              ListTile(
                                title: Text(
                                  'عن المطوريين',
                                  style: textStyle,
                                ),
                                onTap: () => {
                                  launch(search),
                                },
                                trailing: Icon(
                                  Icons.developer_board,
                                  color: Colors.white,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'تواصل معنا',
                                  style: textStyle,
                                ),
                                onTap: () => {
                                  launch(search),
                                },
                                trailing: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF243953),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF243953),
        title: Text(
          'توعية                ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Questv'),
        ),
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
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, '/coronaexp'),
                                    },
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
