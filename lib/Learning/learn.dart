import 'package:flutter/material.dart';

class LearnOne extends StatefulWidget {
  @override
  _LearnOneState createState() => _LearnOneState();
}

class _LearnOneState extends State<LearnOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is a appBar'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Click me '),
            onPressed: () => {Navigator.pushNamed(context, '/learntwo')},
          ),
        ),
      ),
    );
  }
}
