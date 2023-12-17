import 'package:netflix_demo/constants/data.dart';
import 'package:netflix_demo/models/movie.dart';

List<Movie> allMovies = [];

initMovies() => allMovies = moviesData
    .where((element) => element['thumbnail'] != null)
    .map((e) => Movie.fromMap(e))
    .toList();

List<Movie> filterMovies(String type) {
  final movies =
      allMovies.where((element) => element.genres.contains(type)).toList();
  movies.shuffle();
  return movies;
}
