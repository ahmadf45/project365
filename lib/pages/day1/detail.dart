import 'package:flutter/material.dart';
import 'day1.dart';

class Detail extends StatelessWidget {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;

  Detail(
      {Key key,
      @required this.id,
      this.author,
      this.height,
      this.url,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          transitionOnUserGestures: true,
          tag: url,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
