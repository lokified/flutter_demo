
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class PopularMoviesState extends Equatable {

  final List<Movie>? movies;
  final DioException? error;

  const PopularMoviesState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesDone extends PopularMoviesState {
  const PopularMoviesDone(List<Movie> movies) : super(movies: movies);
}

class PopularMoviesError extends PopularMoviesState {
  const PopularMoviesError(DioException error): super(error: error);
}