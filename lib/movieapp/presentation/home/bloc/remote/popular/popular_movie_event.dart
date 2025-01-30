

import 'package:equatable/equatable.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularMovies extends PopularMoviesEvent {
  final int pageKey;

  const GetPopularMovies({required this.pageKey});
}