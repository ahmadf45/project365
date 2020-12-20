import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'Model/movie.dart';
import 'Model/series.dart';
import '../../sizeConfig.dart';
import 'day2Detail.dart';

class Day2Home extends StatefulWidget {
  @override
  _Day2HomeState createState() => _Day2HomeState();
}

class _Day2HomeState extends State<Day2Home> {
  List<Movie> parsePopularMovies(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> fetchPopularMovies(Client client) async {
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=f94a01f0b5b52e13a60ab137ad57c74d&language=en-US&page=1");
    return parsePopularMovies(response.body);
  }

  List<Series> parsePopularSeries(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<Series>((json) => Series.fromJson(json)).toList();
  }

  Future<List<Series>> fetchPopularSeries(Client client) async {
    final response = await client.get(
        "https://api.themoviedb.org/3/tv/popular?api_key=f94a01f0b5b52e13a60ab137ad57c74d&language=en-US&page=1");
    return parsePopularSeries(response.body);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white10,
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Movies",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 15,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FutureBuilder(
                    future: fetchPopularMovies(Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? (MoviesList(movies: snapshot.data))
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Series",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 15,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FutureBuilder(
                    future: fetchPopularSeries(Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? (SeriesList(series: snapshot.data))
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  MoviesList({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Day2Detail(
                        id: movies[index].id,
                      )),
            );
          },
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 33,
            margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image:
                              NetworkImage(imageUrl + movies[index].posterPath),
                          fit: BoxFit.cover)),
                  height: SizeConfig.blockSizeVertical * 28,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(movies[index].title,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                      maxLines: 2,
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SeriesList extends StatelessWidget {
  final List<Series> series;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  SeriesList({Key key, this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: series.length,
      itemBuilder: (context, index) {
        return Container(
          width: SizeConfig.blockSizeHorizontal * 33,
          margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image:
                            NetworkImage(imageUrl + series[index].posterPath),
                        fit: BoxFit.cover)),
                height: SizeConfig.blockSizeVertical * 28,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(series[index].name,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                    maxLines: 2,
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        );
      },
    );
  }
}
