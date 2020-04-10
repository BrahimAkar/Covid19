import 'package:flutter/material.dart';




class MapCard extends StatefulWidget {
  @override
  _MapCardState createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
            bottom: 25,
            left: 8,
            right: 8,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.notifications_active),
                        Text(
                          'مدينة كلميم',
                          style: TextStyle(fontSize: 28),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('بؤرة تفشي'),
                        Icon(Icons.donut_large,size: 11,color: Colors.red,),
                        SizedBox(
                          width: 15,
                        ),
                        Text('جهة كلميم السمارة'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '+28',
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            ),
                            Text('إصابة جديدة',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 22)),
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '+15',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 25),
                            ),
                            Text(
                              'حالة شفاء',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: <Widget>[
                            Text('+2',
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 25)),
                            Text('وفاة',
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 22)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}