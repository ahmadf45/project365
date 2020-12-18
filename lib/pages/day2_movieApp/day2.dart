import 'package:flutter/material.dart';
import 'day2Home.dart';

class Day2 extends StatefulWidget {
  @override
  _Day2State createState() => _Day2State();
}

class _Day2State extends State<Day2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Day2Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage('lib/images/play.png'), fit: BoxFit.cover)),
          child: Center(
            child: Text('UCING'),
          ),
        ),
      ),
    );
  }
}
