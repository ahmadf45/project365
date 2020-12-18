import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Day2Home extends StatefulWidget {
  @override
  _Day2HomeState createState() => _Day2HomeState();
}

class _Day2HomeState extends State<Day2Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "data",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            Text(
              "data",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Movie {
  final int id;
  final String title;

  Movie({this.id, this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
