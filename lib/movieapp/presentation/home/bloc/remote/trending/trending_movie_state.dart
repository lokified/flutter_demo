import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class TrendingMoviesState extends Equatable {
  final List<Movie>? movies;
  final String? error;
  final int currentPage;

  const TrendingMoviesState({this.movies, this.error, this.currentPage = 0});

  @override
  List<Object?> get props => [movies, error, currentPage];
}

class TrendingMovieLoading extends TrendingMoviesState {
  const TrendingMovieLoading();
}

class TrendingMovieDone extends TrendingMoviesState {
  const TrendingMovieDone(List<Movie> movies, int currentPage)
      : super(movies: movies, currentPage: currentPage);
}

class TrendingMovieError extends TrendingMoviesState {
  const TrendingMovieError(String error) : super(error: error);
}
