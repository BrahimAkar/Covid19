import 'package:flutter/material.dart';

class CoronaExplain extends StatefulWidget {
  @override
  _CoronaExplainState createState() => _CoronaExplainState();
}

class _CoronaExplainState extends State<CoronaExplain> {
  Future<bool> circ() async {
    while (true) {
      // await Future.delayed(Duration(seconds: 1));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF243953),
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text('تعرف اكثر على فيروس كورونا')),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF243953),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 35),
                        width: double.infinity,
                        child: Image.asset('assets/images/virus.png'),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 35),
                        child: Text(
                          'فيروس كورونا\n  المستجد',
                          style: TextStyle(fontSize: 45, color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      flex: 5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'أعراض الإصابة',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                height: 180,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/fiver.png', scale: 2),
                            Text(
                              'الحمى',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/kha.png', scale: 2),
                            Text(
                              'السعال',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/breathing.png',
                              scale: 2,
                            ),
                            Text(
                              'صعوبة التنفس',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'نصائح للوقاية',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                height: 195,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/mask.png', scale: 2),
                            Text(
                              'إرتدي كمامة',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/contact.png', scale: 2),
                            Text(
                              'تجنب التواصل\nمع المصابين',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/hand.png',
                              scale: 2,
                            ),
                            Text(
                              'إغسل يديك\nبالماء والصابون',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: circ(),
                builder: (context, snapshot) {
                  if (snapshot.data == false) {
                    return Column(
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.yellow,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          'سيتم تحديث محتوى الصفحة في وقت لاحق..',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
