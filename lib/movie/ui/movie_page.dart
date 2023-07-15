import 'package:cubit_freezed/movie/cubit/movie_cubit.dart';
import 'package:cubit_freezed/movie/cubit/movie_state.dart';
import 'package:cubit_freezed/movie/ui/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: GestureDetector(
                  child: ListTile(
                    title: Text(movies[index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(movies[index].urlImage),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MoviesDetailsPage(selectedMovie: movies[index]),
                    ),);
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}