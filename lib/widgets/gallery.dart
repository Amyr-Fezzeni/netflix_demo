import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/views/movie_details.dart';
import 'package:netflix_demo/widgets/card.dart';

class GalleryWidget extends StatefulWidget {
  final List<Movie> movies;
  const GalleryWidget({super.key, required this.movies});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 440,
      width: screenWidth,
      child: Stack(
        children: [
          SizedBox(
            height: 440,
            width: screenWidth,
            child: Image.network(
              widget.movies[currentIndex].thumbnail.toString(),
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 300,
              width: screenWidth,
              color: Colors.black38,
            ),
          ),
          Positioned(
              bottom: 20,
              child: SizedBox(
                height: 300,
                width: screenWidth,
                child: Gallery3D(
                    itemConfig: const GalleryItemConfig(
                      width: 250,
                      height: 350,
                      radius: 20,
                    ),
                    onItemChanged: (index) => setState(() {
                          currentIndex = index;
                        }),
                    controller: Gallery3DController(
                        itemCount: widget.movies.length, delayTime: 3000),
                    width: screenWidth,
                    onClickItem: (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                movie: widget.movies[currentIndex]))),
                    itemBuilder: (context, index) =>
                        MovieCard(movie: widget.movies[index])),
              ))
        ],
      ),
    );
  }
}
