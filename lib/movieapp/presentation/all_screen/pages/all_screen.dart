import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mentali/movieapp/core/enums/category_type.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/popular/popular_movie_bloc.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/popular/popular_movie_event.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/popular/popular_movie_state.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/trending/trending_movie_bloc.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/trending/trending_movie_event.dart';
import 'package:mentali/movieapp/presentation/home/bloc/remote/trending/trending_movie_state.dart';
import 'package:mentali/movieapp/presentation/home/widgets/movie_item.dart';
import 'package:mentali/movieapp/presentation/home/widgets/placeholder_shimmer.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key, required this.categoryType});

  final CategoryType categoryType;

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  static const _pageSize = 20;
  late final PagingController<int, Movie> _pagingController;

  @override
  void initState() {
    super.initState();

    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener(_fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      switch (widget.categoryType) {
        case CategoryType.POPULAR:
          context.read<PopularMoviesBloc>().add(GetPopularMovies(
            pageKey: pageKey
          ));
        case CategoryType.TRENDING:
          context.read<TrendingMoviesBloc>().add(GetTrendingMovies(
            pageKey: pageKey
          ));
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.categoryType == CategoryType.TRENDING
            ? 'Trending'
            : 'Popular'),
      ),
      body: switch (widget.categoryType) {
        CategoryType.TRENDING =>
          BlocListener<TrendingMoviesBloc, TrendingMoviesState>(
            listener: (context, state) {
              if (state is TrendingMovieError) {
                _pagingController.error = state.error!;
              }
              if (state is TrendingMovieDone) {
                final isLastPage = state.movies!.length < _pageSize;

                if (isLastPage) {
                  _pagingController.appendLastPage(state.movies!);
                } else {
                  final nextPageKey = state.currentPage + 1;
                  _pagingController.appendPage(state.movies!, nextPageKey);
                }
              }
            },
            child: _buildPagedGridView(),
          ),
        CategoryType.POPULAR =>
          BlocListener<PopularMoviesBloc, PopularMoviesState>(
              listener: (context, state) {
            if (state is PopularMoviesError) {
             _pagingController.error = state.error!;
            }
            if (state is PopularMoviesDone) {
              final isLastPage = state.movies!.length < _pageSize;

              if (isLastPage) {
                _pagingController.appendLastPage(state.movies!);
              } else {
                final nextPageKey = state.currentPage + 1;
                _pagingController.appendPage(state.movies!, nextPageKey);
              }
            }
          }, child: _buildPagedGridView(),),
      },
    );
  }

  _buildPagedGridView() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: PagedGridView<int, Movie>(
        pagingController: _pagingController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.74,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, movie, index) {
            return MovieItem(
              movie: movie,
              onTap: (movieId) {
                Navigator.pushNamed(context, 'movieDetail',
                    arguments: movieId);
              },
            );
          },
          firstPageProgressIndicatorBuilder: (_) => Center(
            child: CupertinoActivityIndicator(),
          ),
          newPageProgressIndicatorBuilder: (_) => Center(
            child: PlaceholderShimmer(),
          ),
          noItemsFoundIndicatorBuilder: (_) => Center(
            child: Text('No movies found'),
          ),
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_pagingController.error.toString()),
                ElevatedButton(
                  onPressed: () => _pagingController.refresh(),
                  child: Text('Retry'),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
