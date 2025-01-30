
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/trending/trending_movie_event.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/trending/trending_movie_state.dart';

import '../../../../../domain/usecases/get_trending_movies.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {

  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;

  TrendingMoviesBloc(this._getTrendingMoviesUseCase): super(const TrendingMovieLoading()) {
   on <GetTrendingMovies> (onGetTrendingMovies);
  }

  void onGetTrendingMovies(GetTrendingMovies event, Emitter<TrendingMoviesState> emit) async {
    if (event.pageKey == 1) {
      emit(TrendingMovieLoading());
    }

    final dataState = await _getTrendingMoviesUseCase(params: event.pageKey);

    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {

      emit(TrendingMovieDone(dataState.data!, event.pageKey));
    }

    if(dataState is DataFailed) {
      emit(TrendingMovieError(dataState.error!.message ?? 'Something went wrong!'));
    }
  }
}