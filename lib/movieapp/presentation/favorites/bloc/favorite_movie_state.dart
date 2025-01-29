
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

abstract class FavoriteMoviesState extends Equatable {

  final List<MovieDetail>? movies;
  final String? error;

  const FavoriteMoviesState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class FavoriteMoviesLoading extends FavoriteMoviesState {
  const FavoriteMoviesLoading();
}

class FavoriteMoviesDone extends FavoriteMoviesState {
  const FavoriteMoviesDone(List<MovieDetail> movies): super(movies: movies);
}

class FavoriteMoviesError extends FavoriteMoviesState {
  const FavoriteMoviesError(String error): super(error: error);
}