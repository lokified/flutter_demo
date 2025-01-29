
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class GetFavoriteMoviesUseCase extends UseCase<List<MovieDetail>, void> {

  final MovieRepository _movieRepository;

  GetFavoriteMoviesUseCase(this._movieRepository);

  @override
  Future<List<MovieDetail>> call({void params}) {
    return _movieRepository.getSavedMovies();
  }

}