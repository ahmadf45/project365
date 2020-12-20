class Series {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String name;
  final bool video;
  final int voteCount;

  Series(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.name,
      this.video,
      this.voteCount});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdrop_Path'] as String,
      genreIds: json['genre_ids'].cast<int>() as List<int>,
      adult: json['adult'] as bool,
      releaseDate: json['release_date'] as String,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      popularity: json['popularity'] as double,
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
    );
  }
}
