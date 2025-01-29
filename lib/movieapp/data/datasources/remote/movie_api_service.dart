import 'package:dio/dio.dart';
import 'package:mentali/movieapp/core/constants.dart';
import 'package:mentali/movieapp/data/models/movie.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/movie/upcoming?language=en-US&page=1')
  Future<HttpResponse<UpComingResult>> getUpcomingMovies();

  @GET('/trending/all/day?language=en-US')
  Future<HttpResponse<MovieResult>> getTrendingMovies();

  @GET('/movie/popular?language=en-US&page=1')
  Future<HttpResponse<MovieResult>> getPopularMovies();

  @GET('/movie/{movie_id}?language=en-US')
  Future<HttpResponse<MovieDetail>> getMovieDetails(
    @Path('movie_id') int movieId,
  );
}
