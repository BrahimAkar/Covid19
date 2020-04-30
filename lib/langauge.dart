import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your language'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('العربية'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homescreen');
                  },
                  child: Text('Francais'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
