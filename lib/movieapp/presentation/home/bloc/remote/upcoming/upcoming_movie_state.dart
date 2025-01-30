

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class UpcomingMoviesState extends Equatable {
  final List<Movie>? movies;
  final String? error;

  const UpcomingMoviesState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class UpcomingMoviesLoading extends UpcomingMoviesState {
  const UpcomingMoviesLoading();
}

class UpcomingMoviesDone extends UpcomingMoviesState {
  const UpcomingMoviesDone(List<Movie> movies): super(movies: movies);
}

class UpcomingMoviesError extends UpcomingMoviesState {
  const UpcomingMoviesError(String error): super(error: error);
}