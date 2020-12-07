import 'package:flutter/material.dart';
import 'package:project365/pages/dashboard.dart';
//ucing

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myHomePage = MyHomePage();
    return MaterialApp(
      title: 'Project 365',
      home: myHomePage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(),
    );
  }
}
