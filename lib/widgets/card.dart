import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/views/movie_details.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final double width;
  const MovieCard({super.key, required this.movie, this.width = 300});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => MovieDetails(movie: movie))),
      child: Container(
        width: width,
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              SizedBox(
                width: width,
                child: Image.network(
                  movie.thumbnail.toString(),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.black,
                    child: const Center(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white10,
                      child: Center(
                        child: Text(
                          movie.title,
                          style: boldText,
                        ),
                      ),
                    ),
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
