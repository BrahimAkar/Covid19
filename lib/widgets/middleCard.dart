import 'package:covid19/localization/localization_constants.dart';
import 'package:flutter/material.dart';
import 'raisedButton.dart';

class MiddleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 20, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0.0,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 11, left: 8),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset('assets/images/tadamon.png', scale: 4),
                          SizedBox(
                            width: 41,
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(right: 11),
                              child: Text(
                                getTranslated(context, "tadamon"),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Questv'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    color: Color(0xff264772),
                    onPressed: () {
                      Navigator.pushNamed(context, '/solidarite');
                    },
                  ),
                ),
                RaisedButtonHome(
                  getTranslated(context, "tadabirwika"),
                  'wikaya',
                  '/tadabir',
                ),
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
              spacing: 10, // gap between adjacent chips
              runSpacing: 20, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)
              children: <Widget>[
                RaisedButtonHome(getTranslated(context, "tanbih"), 'tanbih',
                    '/notification'),
                RaisedButtonHome(
                    getTranslated(context, "emergency"), 'tawari', '/sos'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
