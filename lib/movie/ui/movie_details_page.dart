import 'package:cubit_freezed/movie/model/movie_model.dart';
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

class DetailsText extends StatelessWidget {
  const DetailsText({super.key, required this.movieDetail, required this.title, this.isRow = false});

  final String title;
  final String movieDetail;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    if (isRow) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              movieDetail,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              movieDetail,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        ),
      );
    }
  }
}
