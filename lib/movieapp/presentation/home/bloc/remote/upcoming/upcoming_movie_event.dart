
import 'package:equatable/equatable.dart';

abstract class UpcomingMoviesEvent {
  const UpcomingMoviesEvent();
}

class GetUpcomingMovies extends UpcomingMoviesEvent {
  const GetUpcomingMovies();
}