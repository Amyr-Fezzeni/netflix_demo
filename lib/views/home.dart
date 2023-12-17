import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/services/utils.dart';
import 'package:netflix_demo/widgets/appBar.dart';
import 'package:netflix_demo/widgets/buttombar.dart';
import 'package:netflix_demo/widgets/category.dart';
import 'package:netflix_demo/widgets/gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> newMovies = [];
  @override
  void initState() {
    initMovies();
    newMovies = allMovies.getRange(0, 10).toList();
    newMovies.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(context),
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: const CustomButtomBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            GalleryWidget(movies: newMovies),
            CategoryWidget(title: 'Action', movies: filterMovies('Action')),
            CategoryWidget(title: 'Horror', movies: filterMovies('Horror')),
            CategoryWidget(title: 'Drama', movies: filterMovies('Drama')),
            CategoryWidget(title: 'Comedy', movies: filterMovies('Comedy')),
          ],
        ),
      ),
    );
  }
}
