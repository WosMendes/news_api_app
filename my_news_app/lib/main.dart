import 'package:flutter/material.dart';
import 'package:my_news_app/pages/home_page.dart';

void main() {
  runApp(MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My News App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(title: 'Main News'),
    );
  }
}
