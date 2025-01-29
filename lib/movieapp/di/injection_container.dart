
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentali/movieapp/core/constants.dart';
import 'package:mentali/movieapp/core/interceptor/auth_interceptor.dart';
import 'package:mentali/movieapp/data/datasources/local/app_database.dart';
import 'package:mentali/movieapp/data/datasources/remote/movie_api_service.dart';
import 'package:mentali/movieapp/data/repository/movie_repository_impl.dart';
import 'package:mentali/movieapp/domain/repository/movie_repository.dart';
import 'package:mentali/movieapp/domain/usecases/check_is_favorite.dart';
import 'package:mentali/movieapp/domain/usecases/delete_favorite_movie.dart';
import 'package:mentali/movieapp/domain/usecases/get_favorite_detail.dart';
import 'package:mentali/movieapp/domain/usecases/get_favorite_movies.dart';
import 'package:mentali/movieapp/domain/usecases/get_movie_detail.dart';
import 'package:mentali/movieapp/domain/usecases/get_popular_movies.dart';
import 'package:mentali/movieapp/domain/usecases/get_trending_movies.dart';
import 'package:mentali/movieapp/domain/usecases/save_favorite_movie.dart';
import 'package:mentali/movieapp/domain/usecases/update_favorite_movies.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_bloc.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_event.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_bloc.dart';

import '../domain/usecases/get_upcoming_movies.dart';
import '../presentation/home/bloc/remote/popular/popular_movie_bloc.dart';
import '../presentation/home/bloc/remote/trending/trending_movie_bloc.dart';
import '../presentation/home/bloc/remote/upcoming/upcoming_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {

  final dio = Dio();
  dio.interceptors.add(AuthInterceptor(tmdbAccessToken));

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(dio);

  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));
  
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl(), database.movieDao));

  // usecases
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase(sl()));
  sl.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(sl()));
  sl.registerSingleton<GetUpcomingMovieUseCase>(GetUpcomingMovieUseCase(sl()));
  sl.registerSingleton<GetMovieDetailsUseCase>(GetMovieDetailsUseCase(sl()));
  sl.registerSingleton<GetFavoriteMoviesUseCase>(GetFavoriteMoviesUseCase(sl()));
  sl.registerSingleton<SaveFavoriteMovieUseCase>(SaveFavoriteMovieUseCase(sl()));
  sl.registerSingleton<UpdateFavoriteMoviesUseCase>(UpdateFavoriteMoviesUseCase(sl()));
  sl.registerSingleton<DeleteFavoriteMoviesUseCase>(DeleteFavoriteMoviesUseCase(sl()));
  sl.registerSingleton<GetFavoriteMovieDetailUseCase>(GetFavoriteMovieDetailUseCase(sl()));
  sl.registerSingleton<CheckIsFavoriteUseCase>(CheckIsFavoriteUseCase(sl()));

  // bloc
  sl.registerFactory<TrendingMoviesBloc>(() => TrendingMoviesBloc(sl()));
  sl.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(sl()));
  sl.registerFactory<UpcomingMoviesBloc>(() => UpcomingMoviesBloc(sl()));
  sl.registerFactory<FavoriteMovieBloc>(() => FavoriteMovieBloc(sl(), sl(), sl()));
  sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl(), sl(), sl(), sl()));
}