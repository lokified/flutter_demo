
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

import '../bloc/remote/popular/popular_movie_bloc.dart';
import '../bloc/remote/popular/popular_movie_state.dart';
import '../bloc/remote/trending/trending_movie_bloc.dart';
import '../bloc/remote/trending/trending_movie_state.dart';
import '../widgets/movie_carousel.dart';
import '../widgets/movie_item.dart';
import '../widgets/placeholder_shimmer_list.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentali Movie'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieCarousel(),
              _buildRowText('Popular'),
              _buildPopularMoviesList(),
              _buildRowText('Trending'),
              _buildTrendingMoviesList(),
            ],
          ),
        ),
      ),
    );
  }

  _buildRowText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          TextButton(onPressed: () {}, child: Text('See all'))
        ],
      ),
    );
  }

  _buildTrendingMoviesList() {
    return BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
      builder: (_, state) {
        if (state is TrendingMovieLoading) {
          return PlaceholderShimmerList();
        }

        if (state is TrendingMovieError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.error!.error.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (state is TrendingMovieDone) {
          return _buildHorizontalList(state.movies!);
        }

        return SizedBox();
      },
    );
  }

  _buildPopularMoviesList() {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (_, state) {
        if (state is PopularMoviesLoading) {
          return PlaceholderShimmerList();
        }

        if (state is PopularMoviesError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.error!.error.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (state is PopularMoviesDone) {
          return _buildHorizontalList(state.movies!);
        }

        return SizedBox();
      },
    );
  }

  _buildHorizontalList(List<Movie> movies) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: MovieItem(
              movie: movies[index],
              onTap: (id) {
                Navigator.pushNamed(context, 'movieDetail', arguments: id);
              },
            ),
          );
        },
      ),
    );
  }
}
