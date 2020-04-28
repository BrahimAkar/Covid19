import 'package:covid19/localization/localization_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool isTrue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(getTranslated(context, "settings")),
      ),
      body: Column(
        children: <Widget>[
          Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
              return Container(
                padding: EdgeInsets.all(22),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CupertinoSwitch(
                          value: notifier.isDark,
                          onChanged: (value) {
                            notifier.toggleTheme();
                          },
                          activeColor: Colors.green,
                        ),
                        Text(
                          getTranslated(context, "darkMode"),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
