import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class TrendingMoviesState extends Equatable {
  final List<Movie>? movies;
  final DioException? error;

  const TrendingMoviesState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class TrendingMovieLoading extends TrendingMoviesState {
  const TrendingMovieLoading();
}

class TrendingMovieDone extends TrendingMoviesState {
  const TrendingMovieDone(List<Movie> movies) : super(movies: movies);
}

class TrendingMovieError extends TrendingMoviesState {
  const TrendingMovieError(DioException error): super(error: error);
}