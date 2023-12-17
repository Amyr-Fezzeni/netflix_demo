import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/views/category.dart';
import 'package:netflix_demo/widgets/card.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool viewAll;
  const CategoryWidget(
      {super.key,
      required this.title,
      required this.movies,
      this.viewAll = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  title,
                  style: boldText,
                ),
                const Spacer(),
                if (viewAll)
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  movies: movies,
                                  title: title,
                                ))),
                    child: const Text(
                      'View All',
                      style: boldText,
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: PageView(
              controller: PageController(viewportFraction: .5, initialPage: 1),
              padEnds: false,
              children: movies.map((e) => MovieCard(movie: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
