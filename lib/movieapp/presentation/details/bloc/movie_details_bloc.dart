import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/domain/usecases/check_is_favorite.dart';
import 'package:mentali/movieapp/domain/usecases/delete_favorite_movie.dart';
import 'package:mentali/movieapp/domain/usecases/get_movie_detail.dart';
import 'package:mentali/movieapp/domain/usecases/save_favorite_movie.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_event.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_state.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_bloc.dart';

import '../../favorites/bloc/favorite_movie_event.dart';
import '../../favorites/bloc/favorite_movie_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final CheckIsFavoriteUseCase _checkIsFavoriteUseCase;
  final SaveFavoriteMovieUseCase _saveFavoriteMovieUseCase;
  final DeleteFavoriteMoviesUseCase _deleteFavoriteMoviesUseCase;

  MovieDetailsBloc(
    this._getMovieDetailsUseCase,
    this._checkIsFavoriteUseCase,
    this._saveFavoriteMovieUseCase,
    this._deleteFavoriteMoviesUseCase,
  ) : super(MovieDetailsLoading()) {
    on<GetMovieDetail>(onGetMovieDetail);
    on<ToggleFavoriteMovies>(onToggleFavoriteMovies);
  }

  void onGetMovieDetail(
      GetMovieDetail event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());

    final dataState = await _getMovieDetailsUseCase(params: event.movieId);

    final isFavorite = await _checkIsFavoriteUseCase(params: event.movieId);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(MovieDetailsDone(dataState.data!, isFavorite, ''));
    }

    if (dataState is DataFailed) {
      emit(MovieDetailsError(
          dataState.error!.message ?? 'Something went wrong'));
    }
  }

  void onToggleFavoriteMovies(
      ToggleFavoriteMovies event, Emitter<MovieDetailsState> emit) async {
    try {
      final currentState = state;

      if (currentState is MovieDetailsDone) {
        final isCurrentlyFavorite = currentState.isFavorite ?? false;

        if (isCurrentlyFavorite) {
          await _deleteFavoriteMoviesUseCase(params: event.movie);
          emit(MovieDetailsDone(currentState.movie!, false, 'Removed from favorites'));
        } else {
          await _saveFavoriteMovieUseCase(params: event.movie);
          emit(MovieDetailsDone(currentState.movie!, true, 'Added to favorites'));
        }
      }
    } catch (e) {
      emit(MovieDetailsError('Failed!'));
    }
  }
}
