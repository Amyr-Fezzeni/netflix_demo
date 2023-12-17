import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String title;
  int year;
  List<String> cast;
  List<String> genres;
  String? href;
  String? extract;
  String? thumbnail;
  int? thumbnailWidth;
  int? thumbnailHeight;
  Movie({
    required this.title,
    required this.year,
    required this.cast,
    required this.genres,
    this.href,
    this.extract,
    this.thumbnail,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'year': year,
      'cast': cast,
      'genres': genres,
      'href': href,
      'extract': extract,
      'thumbnail': thumbnail,
      'thumbnailWidth': thumbnailWidth,
      'thumbnailHeight': thumbnailHeight,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      year: map['year'] as int,
      cast: List<String>.from((map['cast'] as List<dynamic>)),
      genres: List<String>.from((map['genres'] as List<dynamic>)),
      href: map['href'] != null ? map['href'] as String : null,
      extract: map['extract'] != null ? map['extract'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      thumbnailWidth:
          map['thumbnailWidth'] != null ? map['thumbnailWidth'] as int : null,
      thumbnailHeight:
          map['thumbnailHeight'] != null ? map['thumbnailHeight'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
