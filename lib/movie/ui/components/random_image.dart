import 'dart:math';

import 'package:cubit_freezed/movie/model/movie_model.dart';
import 'package:cubit_freezed/movie/ui/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomImage extends StatefulWidget {
  RandomImage({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  State<RandomImage> createState() => _RandomImageState();
}

class _RandomImageState extends State<RandomImage> {
  Random random = Random();
  int randomMovie = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomMovie = random.nextInt(widget.movies.length);
  }

  @override
  Widget build(BuildContext context) {
    // int randomMovie = random.nextInt(widget.movies.length);
    return GestureDetector(
      child: Hero(
        tag: widget.movies[randomMovie].urlImage,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.movies[randomMovie].urlImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movies[randomMovie].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        context.go('/detailsMovie', extra: widget.movies[randomMovie]);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MoviesDetailsPage(selectedMovie: widget.movies[randomMovie]),
        //   ),
        // );
      },
    );
  }
}
