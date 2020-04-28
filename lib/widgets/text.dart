import 'package:flutter/material.dart';

class Texts {
  Text text(String text, double size, Color color) {
    return (Text(
      text,
    
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    ));
  }
}
