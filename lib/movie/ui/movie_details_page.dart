import 'package:cubit_freezed/movie/model/movie_model.dart';
import 'package:cubit_freezed/movie/ui/components/details_text.dart';
import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatefulWidget {
  const MoviesDetailsPage({super.key, required this.selectedMovie});

  final MovieModel selectedMovie;

  @override
  _MoviesDetailsPageState createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedMovie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    widget.selectedMovie.urlImage,
                    scale: 0.5,
                  ),
                ],
              ),
              DetailsText(
                isRow: true,
                title: "Release Date: ",
                movieDetail: widget.selectedMovie.releaseDate,
              ),
              DetailsText(
                isRow: true,
                title: "Vote: ",
                movieDetail: widget.selectedMovie.voteAverage.toString(),
              ),
              DetailsText(
                title: "Overview: ",
                movieDetail: widget.selectedMovie.overview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
