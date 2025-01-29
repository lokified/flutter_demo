
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class CheckIsFavoriteUseCase extends UseCase<bool, int?> {
  final MovieRepository _movieRepository;

  CheckIsFavoriteUseCase(this._movieRepository);

  @override
  Future<bool> call({int? params}) {
    return _movieRepository.isFavorite(params!);
  }
}