import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: WebView(
            initialUrl: 'http://your-streamlit-url:8501',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}

