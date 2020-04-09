import 'package:flutter/material.dart';

class RaisedButtonHome extends StatelessWidget {
  final text;

  RaisedButtonHome(this.text);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 165,
      height: 53,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        padding: EdgeInsets.only(top: 15, bottom: 15, right: 8, left: 8),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.add_alarm,
              color: Colors.white,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
        color: Color(0xff264772),
        onPressed: () {},
      ),
    );
  }
}
