import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_bloc.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_event.dart';
import 'package:mentali/movieapp/presentation/details/bloc/movie_details_state.dart';
import 'package:mentali/movieapp/presentation/details/widgets/content_section.dart';
import 'package:mentali/movieapp/presentation/details/widgets/details_section.dart';
import 'package:mentali/movieapp/presentation/details/widgets/top_section.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_bloc.dart';
import 'package:mentali/movieapp/presentation/favorites/bloc/favorite_movie_event.dart';

import '../../../core/constants.dart';
import '../../../data/models/movie_detail.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.id});

  final int? id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      context.read<MovieDetailsBloc>().add(GetMovieDetail(movieId: widget.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state.message != null && state.message!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message!,
                ),
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
              ),
            );
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (_, state) {
            if (state is MovieDetailsLoading) {
              return Center(
                child: const CupertinoActivityIndicator(),
              );
            }

            if (state is MovieDetailsError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text('Something went wrong'),
                ),
              );
            }

            if (state is MovieDetailsDone) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.movie != null) ...[
                      TopSection(
                        movie: state.movie!,
                        onNavigateBack: () => Navigator.pop(context),
                      ),
                      ContentSection(
                        movie: state.movie!,
                      ),
                      DetailsSection(movie: state.movie!)
                    ],
                  ],
                ),
              );
            }

            return SizedBox();
          }),
        ),
      ),
    );
  }
}
