class Movie {
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
  final String title;
  final bool video;
  final int voteCount;

  Movie(
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
      this.title,
      this.video,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
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
