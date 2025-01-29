
import '../../../data/models/movie_detail.dart';

abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class GetMovieDetail extends MovieDetailsEvent {
  final int? movieId;
  const GetMovieDetail({this.movieId});
}

class ToggleFavoriteMovies extends MovieDetailsEvent {
  final MovieDetail? movie;
  const ToggleFavoriteMovies({this.movie});
}