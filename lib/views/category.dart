import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/widgets/card.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const CategoryScreen({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white.withOpacity(.05),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white70,
                              size: 25,
                            ),
                          ),
                          Text(
                            '$title movies',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: SizedBox(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          children: movies
              .map((e) => MovieCard(
                  movie: e, width: MediaQuery.of(context).size.width * .28))
              .toList(),
        ),
      ),
    );
  }
}
