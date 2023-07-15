import 'package:cubit_freezed/movie/cubit/movie_cubit.dart';
import 'package:cubit_freezed/movie/cubit/movie_state.dart';
import 'package:cubit_freezed/movie/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(widget.selectedMovie.urlImage,),

                  ],
                ),
            Text("Overview: ${widget.selectedMovie.overview}"),
Text("Release Date: ${widget.selectedMovie.releaseDate}"),
Text("Vote: ${widget.selectedMovie.voteAverage}")
              ],
        ),
      ),
    );
  }
}