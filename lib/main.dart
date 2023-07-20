import 'package:cubit_freezed/counter/cubit/counter_cubit.dart';
import 'package:cubit_freezed/movie/cubit/movie_cubit.dart';
import 'package:cubit_freezed/movie/repository/movie_repository.dart';
import 'package:cubit_freezed/movie/ui/movie_page.dart';
import 'package:cubit_freezed/theme/theme_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Example',
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.dark, // Use the device's theme mode (light or dark)
      home:
      BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(
          repository: MovieRepository(
            Dio(),
          ),
        ),
        child: MoviesPage(),
      ),
      // BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: CounterScreen(),
      // ),
    );
  }
}


