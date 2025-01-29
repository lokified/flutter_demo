import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/core/constants.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_bloc.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_event.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_state.dart';
import 'package:mentali/movieapp/presentation/favorites/widgets/favorite_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteMovieBloc>().add(GetFavoriteMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMovieBloc, FavoriteMoviesState>(
        builder: (context, state) {
      if (state is FavoriteMoviesLoading) {
        return Center(
          child: const CupertinoActivityIndicator(),
        );
      }

      if (state is FavoriteMoviesError) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Something went wrong'),
          ),
        );
      }

      if (state is FavoriteMoviesDone) {
        return state.movies == null || state.movies!.isEmpty
            ? Center(
                child: Text('No Favorites!'),
              )
            : Padding(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                    itemCount: state.movies!.length,
                    itemBuilder: (context, index) {
                      return FavoriteMovieItem(
                        movie: state.movies![index],
                        onDeleteItem: () {
                          context
                              .read<FavoriteMovieBloc>()
                              .add(DeleteFavoriteMovie(state.movies![index]));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Deleted Successfully'),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                            ),
                          );
                        },
                      );
                    }),
              );
      }

      return SizedBox();
    });
  }
}
