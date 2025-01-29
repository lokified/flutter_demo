import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:mentali/movieapp/data/datasources/local/dao/movie_dao.dart';
import 'package:mentali/movieapp/data/datasources/remote/movie_api_service.dart';
import 'package:mentali/movieapp/data/models/movie.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';

import '../../util/util.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _movieApiService;
  final MovieDao _movieDao;

  MovieRepositoryImpl(this._movieApiService, this._movieDao);

  @override
  Future<DataState<List<MovieModel>>> getTrendingMovies() async {
    try {
      final httpResponse = await _movieApiService.getTrendingMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results!);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = getUserFriendlyErrorMessage(e);
      return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: errorMessage,
          )
      );
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {

    try {
      final httpResponse = await _movieApiService.getPopularMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results!);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = getUserFriendlyErrorMessage(e);
      return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: errorMessage,
          )
      );
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getUpcomingMovies() async {

    try {
      final httpResponse = await _movieApiService.getPopularMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results!);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = getUserFriendlyErrorMessage(e);
      return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: errorMessage,
          )
      );
    }
  }

  @override
  Future<DataState<MovieDetail>> getMovieDetails(int? movieId) async {
    if (movieId == null) {
      return DataFailed(
        DioException(
          error: 'Movie ID is null',
          requestOptions: RequestOptions(path: ''),
        ),
      );
    }

    try {
      final httpResponse = await _movieApiService.getMovieDetails(movieId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = getUserFriendlyErrorMessage(e);
      return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: ''),
            error: errorMessage,
          )
      );
    }
  }

  @override
  Future<void> deleteMovie(MovieDetail movie) {
    return _movieDao.deleteMovie(movie);
  }

  @override
  Future<List<MovieDetail>> getSavedMovies() {
    return _movieDao.findAllMovies();
  }

  @override
  Future<void> saveMovie(MovieDetail movie) {
    return _movieDao.insertMovie(movie);
  }

  @override
  Future<void> updateMovie(MovieDetail movie) {
    return _movieDao.updateMovie(movie);
  }

  @override
  Future<MovieDetail?> getMovieById(int id) {
    return _movieDao.getMovieById(id);
  }

  @override
  Future<bool> isFavorite(int id) async {
    final movie = await _movieDao.getMovieById(id);
    return movie != null;
  }
}
