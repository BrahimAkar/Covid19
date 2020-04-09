import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Color(0XFFFEF9B)),
      home: HomeScreen(),
    );
  }
}
