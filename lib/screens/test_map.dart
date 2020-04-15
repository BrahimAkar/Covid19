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
        backgroundColor: Color(0xFF243953),
        elevation: 0.0,
        title: Center(child: Text('التدابير الوقائية         ')),
      ),
      body: WebView(
        initialUrl: "https://covidata.2m.ma/#/ar/news",
        javascriptMode: JavascriptMode.unrestricted,
        
      ),
    );
  }
}
