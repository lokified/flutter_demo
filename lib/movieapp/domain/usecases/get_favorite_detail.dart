
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class GetFavoriteMovieDetailUseCase extends UseCase<MovieDetail?, int?> {

  final MovieRepository _movieRepository;

  GetFavoriteMovieDetailUseCase(this._movieRepository);

  @override
  Future<MovieDetail?> call({int? params}) {
    return _movieRepository.getMovieById(params!);
  }
}