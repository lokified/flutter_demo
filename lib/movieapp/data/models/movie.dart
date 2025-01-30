import 'package:json_annotation/json_annotation.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

part 'movie.g.dart';

@JsonSerializable()
class UpcomingDates {
  final String? maximum;
  final String? minimum;

  const UpcomingDates({this.maximum, this.minimum});

  factory UpcomingDates.fromJson(Map<String, dynamic> json) =>
      _$UpcomingDatesFromJson(json);
}

@JsonSerializable()
class UpComingResult {
  final UpcomingDates? dates;
  final int? page;
  final List<MovieModel>? results;

  const UpComingResult({this.dates, this.page, this.results});

  factory UpComingResult.fromJson(Map<String, dynamic> json) =>
      _$UpComingResultFromJson(json);
}

@JsonSerializable()
class MovieResult {
  final int? page;
  final List<MovieModel>? results;

  const MovieResult({required this.page, required this.results});

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);
}

@JsonSerializable()
class MovieModel extends Movie {

  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;

  @override
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;

  @override
  @JsonKey(name: "original_language")
  final String? originalLanguage;

  const MovieModel({
    required int id,
    required String? title,
    required String? overview,
    required this.posterPath,
    required this.backdropPath,
    required String? mediaType,
    required this.originalLanguage,
  }) : super(
    id: id,
    title: title,
    overview: overview,
    posterPath: posterPath,
    backdropPath: backdropPath,
    mediaType: mediaType,
    originalLanguage: originalLanguage,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
