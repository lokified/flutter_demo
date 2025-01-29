import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

abstract class MovieDetailsState extends Equatable {
  final MovieDetail? movie;
  final String? error;
  final bool? isFavorite;
  final String? message;

  const MovieDetailsState({this.movie, this.error, this.isFavorite, this.message});

  @override
  List<Object?> get props => [movie, error, isFavorite];
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsDone extends MovieDetailsState {
  const MovieDetailsDone(MovieDetail movie, bool? isFavorite, String? message)
      : super(movie: movie, isFavorite: isFavorite, message: message);
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError(String error) : super(error: error);
}
