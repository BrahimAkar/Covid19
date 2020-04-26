import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestMap extends StatefulWidget {
  @override
  _TestMapState createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          'التدابير الوقائية',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: WebView(
        initialUrl: "https://covidata.2m.ma/#/ar/news",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
