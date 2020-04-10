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
              spacing: 28.0, // gap between adjacent chips
              runSpacing: 20, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)
              children: <Widget>[
                RaisedButtonHome('التضامن  ', 'tadamon', null),
                RaisedButtonHome(
                  'التدابير الوقائية',
                  'wikaya',
                  '/medical',
                  
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
              spacing: 28.0, // gap between adjacent chips
              runSpacing: 20, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)
              children: <Widget>[
                RaisedButtonHome('التنبيه التلقائي  ', 'tanbih',null),
                RaisedButtonHome('أرقام الطوارئ   ', 'tawari',null),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
