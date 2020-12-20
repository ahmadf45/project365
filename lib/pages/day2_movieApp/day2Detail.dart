import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:project365/pages/day2_movieApp/Model/genre.dart';
import '../../sizeConfig.dart';
import 'Model/movieDetail.dart';
import 'Model/genre.dart';
import 'Model/credit.dart';

class Day2Detail extends StatelessWidget {
  final String apiKey = 'f94a01f0b5b52e13a60ab137ad57c74d';
  final int id;

  Day2Detail({
    Key key,
    @required this.id,
  }) : super(key: key);

  Future<MovieDetail> fetchDetail() async {
    final response = await get(
        'https://api.themoviedb.org/3/movie/$id?api_key=f94a01f0b5b52e13a60ab137ad57c74d&language=en-US');

    return MovieDetail.fromJson(jsonDecode(response.body));
  }

  List<Genre> parseGenres(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['genres'].cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<Genre>((json) => Genre.fromJson(json)).toList();
  }

  Future<List<Genre>> fetchGenres(Client client) async {
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/$id?api_key=f94a01f0b5b52e13a60ab137ad57c74d&language=en-US");
    return parseGenres(response.body);
  }

  List<Credit> parseCredit(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['cast'].cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }

  Future<List<Credit>> fetchCredit(Client client) async {
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=f94a01f0b5b52e13a60ab137ad57c74d&language=en-US");
    return parseCredit(response.body);
  }

  Container topView(
      String title,
      String backdropPath,
      String posterPath,
      num voteAverage,
      String releaseDate,
      String overview,
      int runtime,
      BuildContext context) {
    String durationToString(int minutes) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    }

    String imageUrl = 'https://image.tmdb.org/t/p/w780';
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  image: DecorationImage(
                      // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hue),
                      image: NetworkImage(imageUrl + backdropPath),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 280,
                        width: 180,
                        margin: EdgeInsets.only(bottom: 20, top: 50),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            image: DecorationImage(
                                // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hue),
                                image: NetworkImage(imageUrl + posterPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Text(
                        title + ' ' + '(' + releaseDate.substring(0, 4) + ')',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                        child: FutureBuilder(
                          future: fetchGenres(Client()),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? (GenreList(genres: snapshot.data))
                                : Center();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(durationToString(runtime) + 'm',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          SizedBox(width: 50),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          SizedBox(width: 1),
                          Text(voteAverage.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        overview,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cast',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FutureBuilder(
                        future: fetchCredit(Client()),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);

                          return snapshot.hasData
                              ? (CreditList(credits: snapshot.data))
                              : Center();
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: Stack(
          children: [
            FutureBuilder<MovieDetail>(
              future: fetchDetail(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? topView(
                        snapshot.data.title,
                        snapshot.data.backdropPath,
                        snapshot.data.posterPath,
                        snapshot.data.voteAverage,
                        snapshot.data.releaseDate,
                        snapshot.data.overview,
                        snapshot.data.runtime,
                        context)
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.brown),
                            strokeWidth: 5,
                          ),
                        ),
                      );
              },
            ),
            Align(
              alignment: Alignment(-0.9, -0.9),
              child: Container(
                height: 50,
                width: 50,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreList extends StatelessWidget {
  final int runtime;
  final num popularity;
  final List<Genre> genres;

  GenreList({Key key, this.genres, this.popularity, this.runtime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Text(
              genres[index].name + ', ',
              style: TextStyle(color: Colors.grey),
            );
          }),
    );
  }
}

class CreditList extends StatelessWidget {
  final List<Credit> credits;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';
  CreditList({Key key, this.credits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: credits.length,
      itemBuilder: (context, index) {
        return (credits[index].profilePath != null)
            ? Hero(
                tag: credits[index].profilePath,
                child: Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(imageUrl + credits[index].profilePath,
                        fit: BoxFit.cover),
                  ),
                ),
              )
            : Hero(
                tag: "https://picsum.photos/id/130/200/300",
                child: Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network("https://picsum.photos/id/130/200/300",
                        fit: BoxFit.cover),
                  ),
                ),
              );
      },
    );
  }
}
