import 'package:flutter/material.dart';
import 'package:imback/Authenticate/authenticate.dart';
import 'package:imback/main.dart';
import 'package:imback/models/user.dart';
import 'package:imback/screens/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either Home Or Authenticate
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
