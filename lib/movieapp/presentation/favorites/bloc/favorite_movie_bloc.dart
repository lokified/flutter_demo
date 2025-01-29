

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/domain/usecases/delete_favorite_movie.dart';
import 'package:mentali/movieapp/domain/usecases/get_favorite_movies.dart';
import 'package:mentali/movieapp/domain/usecases/save_favorite_movie.dart';
import 'package:mentali/movieapp/domain/usecases/update_favorite_movies.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_event.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_state.dart';

class FavoriteMovieBloc extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {

  final GetFavoriteMoviesUseCase _favoriteMoviesUseCase;
  final UpdateFavoriteMoviesUseCase _updateFavoriteMoviesUseCase;
  final DeleteFavoriteMoviesUseCase _deleteFavoriteMoviesUseCase;

  FavoriteMovieBloc(
      this._favoriteMoviesUseCase,
      this._updateFavoriteMoviesUseCase,
      this._deleteFavoriteMoviesUseCase
      ): super(const FavoriteMoviesLoading()) {
    on<GetFavoriteMovies>(onGetFavoriteMovies);
    on<UpdateFavoriteMovie>(onUpdateFavoriteMovies);
    on<DeleteFavoriteMovie>(onDeleteFavoriteMovies);
  }

  void onGetFavoriteMovies(GetFavoriteMovies event, Emitter<FavoriteMoviesState> emit) async {
    try {
      final movies = await _favoriteMoviesUseCase();
      emit(FavoriteMoviesDone(movies));
    } catch (e) {
      emit(FavoriteMoviesError('Something went wrong'));
    }
  }

  void onUpdateFavoriteMovies(UpdateFavoriteMovie event, Emitter<FavoriteMoviesState> emit) async {
    try {
      await _updateFavoriteMoviesUseCase(params: event.movie);
      final movies = await _favoriteMoviesUseCase();
      emit(FavoriteMoviesDone(movies));
    } catch(e) {
      emit(FavoriteMoviesError('Could not update Movie!'));
    }
  }

  void onDeleteFavoriteMovies(DeleteFavoriteMovie event, Emitter<FavoriteMoviesState> emit) async {
    try {
      await _deleteFavoriteMoviesUseCase(params: event.movie);
      final movies = await _favoriteMoviesUseCase();
      emit(FavoriteMoviesDone(movies));
    } catch (e) {
      emit(FavoriteMoviesError('Could not delete Movie!'));
    }
  }
}