import 'package:flutter/material.dart';

class RaisedButtonHome extends StatelessWidget {
  final text;
  final img;
  // BuildContext context;
  String routeName;

  RaisedButtonHome(this.text, this.img, this.routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.41,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        padding: EdgeInsets.only(top: 15, bottom: 15, right: 11, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('assets/images/$img.png', scale: 4),
            SizedBox(
              width: 25,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'Questv'),
            )
          ],
        ),
        color: Color(0xff264772),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
