
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/core/usecase/usecase.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

class GetTrendingMoviesUseCase implements UseCase<DataState<List<Movie>>, void>  {

  final MovieRepository _movieRepository;

  GetTrendingMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<Movie>>> call({void params}) {
    return _movieRepository.getTrendingMovies();
  }
}