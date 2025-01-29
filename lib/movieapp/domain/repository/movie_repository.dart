
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/data/models/movie.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieModel>>> getUpcomingMovies();
  Future<DataState<List<MovieModel>>> getTrendingMovies();
  Future<DataState<List<MovieModel>>> getPopularMovies();
  Future<DataState<MovieDetail>> getMovieDetails(int? movieId);

  //local
  Future<void> saveMovie(MovieDetail movie);
  Future<void> updateMovie(MovieDetail movie);
  Future<void> deleteMovie(MovieDetail movie);
  Future<MovieDetail?> getMovieById(int id);
  Future<bool> isFavorite(int id);
  Future<List<MovieDetail>> getSavedMovies();
}