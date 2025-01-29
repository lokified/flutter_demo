
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class DeleteFavoriteMoviesUseCase extends UseCase<void, MovieDetail?> {

  final MovieRepository _movieRepository;

  DeleteFavoriteMoviesUseCase(this._movieRepository);

  @override
  Future<void> call({MovieDetail? params}) {
    return _movieRepository.deleteMovie(params!);
  }
}