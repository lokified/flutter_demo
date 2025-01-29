import 'package:mentali/movieapp/domain/entities/movie.dart';

class UpcomingDates {
  final String? maximum;
  final String? minimum;

  const UpcomingDates({this.maximum, this.minimum});

  factory UpcomingDates.fromJson(Map<String, dynamic> json) {
    return UpcomingDates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }
}

class UpComingResult {
  final UpcomingDates? dates;
  final int? page;
  final List<MovieModel>? results;

  const UpComingResult({this.dates, this.page, this.results});

  factory UpComingResult.fromJson(Map<String, dynamic> json) {
    return UpComingResult(
        dates: json['dates'],
        page: json['page'] ?? 0,
        results: (json['results'] as List<dynamic>?)
                ?.map((movie) =>
                    MovieModel.fromJson(movie as Map<String, dynamic>))
                .toList() ??
            []);
  }
}

class MovieResult {
  final int? page;
  final List<MovieModel>? results;

  const MovieResult({required this.page, required this.results});

  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(
        page: json['page'] ?? 0,
        results: (json['results'] as List<dynamic>?)
                ?.map((movie) =>
                    MovieModel.fromJson(movie as Map<String, dynamic>))
                .toList() ??
            []);
  }
}

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.posterPath,
      required super.backdropPath,
      required super.mediaType,
      required super.originalLanguage});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        mediaType: json['media_type'] ?? '',
        originalLanguage: json['original_language'] ?? '');
  }
}
