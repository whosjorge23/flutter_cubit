import 'package:cubit_freezed/counter/cubit/counter_cubit.dart';
import 'package:cubit_freezed/movie/cubit/movie_cubit.dart';
import 'package:cubit_freezed/movie/model/movie_model.dart';
import 'package:cubit_freezed/movie/repository/movie_repository.dart';
import 'package:cubit_freezed/movie/ui/movie_details_page.dart';
import 'package:cubit_freezed/movie/ui/movie_page.dart';
import 'package:cubit_freezed/theme/theme_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'counter/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cubit Example',
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.dark,
      // Use the device's theme mode (light or dark)
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: BlocProvider<MoviesCubit>(
                create: (context) => MoviesCubit(
                  repository: MovieRepository(
                    Dio(),
                  ),
                ),
                child: MoviesPage(),
              ),
            ),
            routes: [
              GoRoute(
                path: 'detailsMovie', // Define a route parameter ':movieId'
                pageBuilder: (context, state) {
                  // Extract the movieId from the route parameters
                  final selectedMovie = state.extra! as MovieModel;
                  return MaterialPage(
                    child: MoviesDetailsPage(
                      selectedMovie: selectedMovie,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
