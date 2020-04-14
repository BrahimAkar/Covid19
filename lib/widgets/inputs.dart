import 'package:flutter/material.dart';

class Inputs {
//input design for first input (decoration)
  InputDecoration inputdecorationnormal(String text) {
    return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(color: Color(0xff5C6C7F)),
      border: new OutlineInputBorder(
        borderSide: new BorderSide(
          color: Color(0xff5C6C7F),
        ),
      ),
      filled: true,
      icon: new Icon(
        Icons.check_circle,
        color: Colors.lightBlue,
      ),
    );
  }

//inputs
  TextField inputwidget(TextEditingController _controller,
      InputDecoration inputDecoration, double fontsize) {
    return new TextField(
      controller: _controller,
      style: TextStyle(fontSize: fontsize, color: Colors.blue, height: 2.4),
      textAlignVertical: TextAlignVertical.center,
      decoration: inputDecoration,
      textAlign: TextAlign.right,
    );
  }

//text
  Text text(String text, double size) {
    return (Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        //fontWeight:FontWeight.bold,
        fontSize: size,
        color: Colors.white,
      ),
    ));
  }
}
