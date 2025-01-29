import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_bloc.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_state.dart';
import 'package:mentali/movieapp/presentation/details/widgets/action_container.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_event.dart';

import '../../favorites/bloc/favorite_movie_bloc.dart';
import '../bloc/movie_details_event.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key, required this.movie,});

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildActionSection(),
          SizedBox(
            height: 24,
          ),
          Text(
            movie.overview!,
            style: TextStyle(
                color: ColorScheme.of(context).onSurface.withValues(alpha: 0.8),
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  _buildActionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('Watch Now'),
        ),
        BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) => Row(
            children: [
              ActionContainer(icon: Icons.download),
              ActionContainer(
                icon: state.isFavorite ?? false
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: state.isFavorite ?? false
                    ? Colors.blue
                    : Colors.grey,
                onTap: () {
                  context
                      .read<MovieDetailsBloc>()
                      .add(ToggleFavoriteMovies(movie: state.movie));

                  context
                      .read<FavoriteMovieBloc>()
                      .add(GetFavoriteMovies());
                },
              ),
              ActionContainer(icon: Icons.share),
            ],
          ),
        ),
      ],
    );
  }
}
