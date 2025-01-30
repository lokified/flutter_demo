

abstract class TrendingMoviesEvent {
  const TrendingMoviesEvent();
}

class GetTrendingMovies extends TrendingMoviesEvent {
  final int pageKey;
  const GetTrendingMovies({required this.pageKey});
}