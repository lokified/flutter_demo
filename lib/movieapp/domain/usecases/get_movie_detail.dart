
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class GetMovieDetailsUseCase implements UseCase<DataState<MovieDetail>, int?> {
  final MovieRepository _movieRepository;

  const GetMovieDetailsUseCase(this._movieRepository);

  @override
  Future<DataState<MovieDetail>> call({int? params}) {
    return _movieRepository.getMovieDetails(params);
  }
}