import 'package:flutter/material.dart';

class MapCard extends StatelessWidget {
  //String cityName = "";
  final int recovered;
  final int deaths;
  final int totalCases;
  final String date;
  MapCard(this.recovered, this.deaths, this.totalCases, this.date);
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
          height: 155,
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
                      'المملكة المغربية',
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          totalCases.toString(),
                          style: TextStyle(color: Colors.red, fontSize: 25),
                        ),
                        Text('عدد الإصابات',
                            style: TextStyle(color: Colors.red, fontSize: 22)),
                      ],
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          recovered.toString(),
                          style: TextStyle(color: Colors.green, fontSize: 25),
                        ),
                        Text(
                          'حالة الشفاء',
                          style: TextStyle(color: Colors.green, fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      children: <Widget>[
                        Text(deaths.toString(),
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 25)),
                        Text('وفاة',
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 22)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "آخر تحديث : " + date.substring(0, 10),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
