import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/enums/category_type.dart';
import 'package:mentali/movieapp/core/theme/theme.dart';
import 'package:mentali/movieapp/di/injection_container.dart';
import 'package:mentali/movieapp/presentation/all_screen/pages/all_screen.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_bloc.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_event.dart';
import 'package:mentali/movieapp/presentation/details/pages/movie_details.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_bloc.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_event.dart';
import 'package:mentali/movieapp/presentation/widgets/bottom_nav.dart';

import 'movieapp/presentation/home/bloc/remote/popular/popular_movie_bloc.dart';
import 'movieapp/presentation/home/bloc/remote/popular/popular_movie_event.dart';
import 'movieapp/presentation/home/bloc/remote/trending/trending_movie_bloc.dart';
import 'movieapp/presentation/home/bloc/remote/trending/trending_movie_event.dart';
import 'movieapp/presentation/home/bloc/remote/upcoming/upcoming_movie_bloc.dart';
import 'movieapp/presentation/home/bloc/remote/upcoming/upcoming_movie_event.dart';
import 'movieapp/presentation/home/pages/movie_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //movie app
  await initAppModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _initMovieApp(context);
  }

  _initMovieApp(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [
        BlocProvider<TrendingMoviesBloc>(
            create: (context) => sl()..add(GetTrendingMovies(pageKey: 1))),
        BlocProvider<PopularMoviesBloc>(
            create: (context) => sl()..add(GetPopularMovies(pageKey: 1))),
        BlocProvider<UpcomingMoviesBloc>(
            create: (context) => sl()..add(GetUpcomingMovies())),
        BlocProvider<MovieDetailsBloc>(create: (context) => sl()),
        BlocProvider<FavoriteMovieBloc>(
            create: (context) => sl()..add(GetFavoriteMovies())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        routes: {
          '/': (context) => BottomNav(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == 'movieDetail') {
            final movieId = settings.arguments as int;
            return MaterialPageRoute(
                builder: (context) => MovieDetailsPage(id: movieId));
          }

          if (settings.name == 'allScreen') {
            final categoryType = settings.arguments as CategoryType;
            return MaterialPageRoute(
                builder: (context) => AllScreen(categoryType: categoryType));
          }
        },
      ),
    );
  }
}
