import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget{

final Function() method;
final String text;
final Color snapcolor;
final Color textcolor;
final Color backcolor;
final Icon icon;

IconButtons({
  @required this.text,
  @required this.method,
  @required this.snapcolor,
  @required this.textcolor,
  @required this.backcolor,
  @required this.icon,
});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: icon,
      color: backcolor,
      onPressed: method,
      label: Text(text,
          style: TextStyle(
            color: textcolor,
            fontSize: 20.0,
          )),
      animationDuration: Duration(seconds:4),
      splashColor: snapcolor,
    );
  }


}