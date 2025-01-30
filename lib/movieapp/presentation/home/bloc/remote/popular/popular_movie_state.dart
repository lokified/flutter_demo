import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class PopularMoviesState extends Equatable {
  final int currentPage;
  final List<Movie>? movies;
  final String? error;

  const PopularMoviesState({this.movies, this.error, this.currentPage = 0});

  @override
  List<Object?> get props => [movies, error, currentPage];
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesDone extends PopularMoviesState {
  const PopularMoviesDone(List<Movie> movies, int currentPage)
      : super(movies: movies, currentPage: currentPage);
}

class PopularMoviesError extends PopularMoviesState {
  const PopularMoviesError(String error) : super(error: error);
}
