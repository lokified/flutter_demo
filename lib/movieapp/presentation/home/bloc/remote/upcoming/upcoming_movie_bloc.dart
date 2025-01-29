
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/domain/usecases/get_popular_movies.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/upcoming/upcoming_movie_event.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/upcoming/upcoming_movie_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {

  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  UpcomingMoviesBloc(this._getPopularMoviesUseCase): super(const UpcomingMoviesLoading()) {
    on<GetUpcomingMovies>(onGetUpcomingMovies);
  }

  void onGetUpcomingMovies(GetUpcomingMovies event, Emitter<UpcomingMoviesState> emit) async {
    final dataState = await _getPopularMoviesUseCase();

    if (dataState.data!.isNotEmpty && dataState is DataSuccess) {
      emit(UpcomingMoviesDone(dataState.data!));
    }

    if(dataState is DataFailed) {
      emit(UpcomingMoviesError(dataState.error!));
    }
  }
}