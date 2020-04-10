import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/SecondScreen.dart';
import 'screens/MedicalFile.dart';
import 'screens/MapLive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
SystemChrome.setEnabledSystemUIOverlays ([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
        fontFamily: 'Questv',
        primarySwatch: Colors.red,
        accentColor: Color(0XFFFEF9B),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/medical': (context) => MedicalFile(),
        '/maplive': (context) => MapLive(),
      },
    );
  }
}
