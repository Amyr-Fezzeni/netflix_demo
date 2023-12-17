import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';
import 'package:netflix_demo/models/movie.dart';
import 'package:netflix_demo/services/utils.dart';
import 'package:netflix_demo/widgets/category.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white70, size: 35))),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SizedBox(
                  width: w,
                  height: h,
                  child: Image.network(widget.movie.thumbnail.toString(),
                      fit: BoxFit.cover)),
              SizedBox(
                width: w,
                height: h * .6,
                child: Stack(
                  children: [
                    SizedBox(
                        width: w,
                        height: h * .6,
                        child: Image.network(widget.movie.thumbnail.toString(),
                            fit: BoxFit.cover)),
                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(4, 4),
                                  blurRadius: 4)
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: .6,
                  minChildSize: .5,
                  maxChildSize: .9,
                  expand: true,
                  builder: (context, scrollController) => SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 150.0, sigmaY: 150.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.122),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5, bottom: 20),
                                                height: 3,
                                                width: 100,
                                                color: iconColor,
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                  '${widget.movie.title}\n${widget.movie.year}',
                                                  textAlign: TextAlign.center,
                                                  style: title),
                                            ),
                                            const Divider(
                                              height: 50,
                                              color: iconColor,
                                              thickness: 1,
                                              indent: 20,
                                              endIndent: 20,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Wrap(
                                                    spacing: 10,
                                                    runSpacing: 10,
                                                    children:
                                                        widget.movie.genres
                                                            .map(
                                                                (e) =>
                                                                    Container(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white10,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)),
                                                                      child: Text(
                                                                          e.toString(),
                                                                          style: boldText),
                                                                    ))
                                                            .toList(),
                                                  ),
                                                ),
                                                ...[
                                                  const Icon(
                                                    Icons.share,
                                                    color: iconColor,
                                                    size: 35,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Icon(
                                                    Icons.favorite,
                                                    color: iconColor,
                                                    size: 35,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ]
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text('Story Line',
                                                style: boldText.copyWith(
                                                    fontSize: 18)),
                                            RichText(
                                              text: TextSpan(
                                                text: widget.movie.extract
                                                    .toString()
                                                    .substring(
                                                        0,
                                                        more
                                                            ? null
                                                            : widget.movie
                                                                        .extract
                                                                        .toString()
                                                                        .length >
                                                                    140
                                                                ? 140
                                                                : widget.movie
                                                                    .extract
                                                                    .toString()
                                                                    .length),
                                                style: text,
                                                children: <TextSpan>[
                                                  if (widget.movie.extract
                                                          .toString()
                                                          .length >
                                                      140)
                                                    const TextSpan(
                                                      text: '...',
                                                    ),
                                                  if (widget.movie.extract
                                                          .toString()
                                                          .length >
                                                      140)
                                                    TextSpan(
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () =>
                                                                  setState(
                                                                      () =>
                                                                          more =
                                                                              !more),
                                                        text: more
                                                            ? ' Less'
                                                            : ' More',
                                                        style:
                                                            boldText.copyWith(
                                                                color: Colors
                                                                    .red)),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 10),
                                              child: Text('Cast',
                                                  style: boldText.copyWith(
                                                      fontSize: 18)),
                                            ),
                                            Wrap(
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: widget.movie.cast
                                                  .map((e) => Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.white10,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Text(
                                                            e.toString(),
                                                            style: boldText),
                                                      ))
                                                  .toList(),
                                            ),
                                            CategoryWidget(
                                                title: 'More like this',
                                                movies: filterMovies(
                                                    widget.movie.genres.first),
                                                viewAll: false),
                                            const SizedBox(height: 150)
                                          ])))))))
            ])));
  }
}
