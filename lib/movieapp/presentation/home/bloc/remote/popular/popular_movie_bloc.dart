import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';
import 'package:mentali/movieapp/domain/usecases/get_popular_movies.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/popular/popular_movie_event.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/popular/popular_movie_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesBloc(this._getPopularMoviesUseCase)
      : super(const PopularMoviesLoading()) {
    on<GetPopularMovies>(onGetPopularMovies);
  }

  void onGetPopularMovies(
      GetPopularMovies event, Emitter<PopularMoviesState> emit) async {
    if (event.pageKey == 1) {
      emit(PopularMoviesLoading());
    }

    final dataState = await _getPopularMoviesUseCase(params: event.pageKey);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(PopularMoviesDone(dataState.data!, event.pageKey));
    }

    if (dataState is DataFailed) {
      emit(PopularMoviesError(
          dataState.error!.message ?? 'Something went wrong!'));
    }
  }
}
