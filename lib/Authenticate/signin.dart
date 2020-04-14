import 'package:flutter/material.dart';
import 'package:imback/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
          child: Center(
        child: RaisedButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(14),
          onPressed: () async {
            dynamic results = await _auth.signInAnon();
            if (results == null) {
              print('Error Signin');
            } else {
              print(results.uid);
            }
          },
          color: Colors.deepOrange,
          child: Text('Sign in Anonymously'),
        ),
      )),
    );
  }
}
