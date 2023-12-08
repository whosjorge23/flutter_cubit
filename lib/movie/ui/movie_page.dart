import 'package:cubit_freezed/movie/cubit/movie_cubit.dart';
import 'package:cubit_freezed/movie/cubit/movie_state.dart';
import 'package:cubit_freezed/movie/ui/components/random_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;
            return ListView.builder(
              itemCount: movies.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return RandomImage(movies: movies);
                } else {
                  final movieIndex = index - 1;
                  return Card(
                    child: GestureDetector(
                      child: ListTile(
                        title: Text(movies[movieIndex].title),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(movies[movieIndex].urlImage),
                        ),
                      ),
                      onTap: () {
                        context.go('/detailsMovie', extra: movies[movieIndex]);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MoviesDetailsPage(selectedMovie: movies[movieIndex]),
                        //   ),
                        // );
                      },
                    ),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
