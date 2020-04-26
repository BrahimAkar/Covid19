import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imback/widgets/bottomCard.dart';
import 'package:imback/widgets/middleCard.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import '../theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String search =
      "https://play.google.com/store/search?q=com.sensibilisation19.app&c=apps&hl=en";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).accentColor,
    );
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                            padding: EdgeInsets.only(bottom: 18, top: 18),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            color: Colors.deepOrange,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/images/0.png'),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: Material(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onTap: () => {
                                      launch(search),
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  ListTile(
                                    title: Text(
                                      'موقعنا الرسمي',
                                      style: textStyle,
                                    ),
                                    onTap: () => {
                                      launch('https://sensibilisation19.com/'),
                                    },
                                    trailing: Icon(
                                      Icons.apps,
                                      color: Theme.of(context).accentColor,
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
                                      color: Theme.of(context).accentColor,
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
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'تواصل معنا',
                                      style: textStyle,
                                    ),
                                    onTap: () => {
                                      launch(
                                          'mailto:contact@sensibilisation19.com')
                                    },
                                    trailing: Icon(
                                      Icons.phone,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'إعدادات التطبيق',
                                      style: textStyle,
                                    ),
                                    trailing: Icon(
                                      Icons.settings,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onTap: () => {
                                      Navigator.pushNamed(context, '/settings')
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  ListTile(
                                    title: Center(
                                      child: Text('Simpower@2020',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white24,
                                          )),
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
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            elevation: 1,
            //  backgroundColor: myTheme.getColor(),
            title: Text(
              'توعية',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: notifier.isDark ? Colors.white : Color(0xFF243953),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Questv'),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)),
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
                                            child: Lottie.asset(
                                              'assets/doctor3.json',
                                              width: 150,
                                              height: 437,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        onPressed: () => {
                                          Navigator.pushNamed(
                                              context, '/coronaexp'),
                                        },
                                        child: Text(
                                          'قراءة',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Questv',
                                              fontSize: 18),
                                        ),
                                        color: Colors.white,
                                        textColor: Colors.deepOrange,
                                        padding:
                                            EdgeInsets.fromLTRB(55, 0, 55, 0),
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
        ),
      );
    });
  }
}
