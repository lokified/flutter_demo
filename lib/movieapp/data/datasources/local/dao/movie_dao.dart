
import 'package:floor/floor.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

@dao
abstract class MovieDao {

  @Query("SELECT * FROM movies")
  Future<List<MovieDetail>> findAllMovies();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieDetail movie);
  
  @Query("SELECT * FROM movies WHERE id = :id")
  Future<MovieDetail?> getMovieById(int id);

  @update
  Future<void> updateMovie(MovieDetail movie);

  @delete
  Future<void> deleteMovie(MovieDetail movie);
}