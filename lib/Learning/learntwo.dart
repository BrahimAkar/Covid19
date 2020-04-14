import 'package:flutter/material.dart';

class LearnTwo extends StatefulWidget {
  @override
  _LearnTwoState createState() => _LearnTwoState();
}

class _LearnTwoState extends State<LearnTwo> {
  // final mySteam = NumberCreator().stream;

  Future<int> _getSomeData() async {
    await Future.delayed(Duration(seconds: 4));
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn two'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getSomeData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Text(snapshot.data),
              );
            }
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Colors.yellow,
              strokeWidth: 10,
            );
          },
        ),
      ),
    );
  }
}
