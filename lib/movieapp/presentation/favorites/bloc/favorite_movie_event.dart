
import 'package:equatable/equatable.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

abstract class FavoriteMoviesEvent extends Equatable {
  final MovieDetail? movie;

  const FavoriteMoviesEvent({this.movie});

  @override
  List<Object?> get props => [movie];
}

class GetFavoriteMovies extends FavoriteMoviesEvent {
  const GetFavoriteMovies();
}

class UpdateFavoriteMovie extends FavoriteMoviesEvent {
  const UpdateFavoriteMovie(movie): super(movie: movie);
}

class DeleteFavoriteMovie extends FavoriteMoviesEvent {
  const DeleteFavoriteMovie(movie): super(movie: movie);
}
