import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/presentation/home/widgets/placeholder_shimmer.dart';
import '../../../domain/entities/movie.dart';
import '../bloc/remote/upcoming/upcoming_movie_bloc.dart';
import '../bloc/remote/upcoming/upcoming_movie_state.dart';
import 'movie_item.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  _startAutoScroll(int length) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: (_, state) {
        if (state is UpcomingMoviesLoading) {
          return PlaceholderShimmer();
        }

        if (state is UpcomingMoviesError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.error!,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (state is UpcomingMoviesDone) {
          _startAutoScroll(state.movies!.length);
          return _buildUpcomingMoviesList(state.movies!);
        }

        return SizedBox();
      },
    );
  }

  _buildUpcomingMoviesList(List<Movie> movies) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieItem(
                  movie: movies[index],
                  onTap: (id) {
                    Navigator.pushNamed(context, 'movieDetail', arguments: id);
                  },
                );
              }),
        ),
        _buildPaginatedDots(movies.length),
      ],
    );
  }

  _buildPaginatedDots(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? ColorScheme.of(context).primary
                : ColorScheme.of(context).onSurface.withValues(alpha: 0.5),
          ),
        );
      }),
    );
  }
}
