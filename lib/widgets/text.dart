import 'package:flutter/material.dart';

class Texts {
  Text text(String text, double size) {
    return (Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    ));
  }
}
