import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final String? backdropPath;

  const Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.mediaType,
      required this.originalLanguage});

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        mediaType,
        originalLanguage,
        backdropPath
      ];
}
