import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

import '../../../core/constants.dart';

class TopSection extends StatelessWidget {
  const TopSection(
      {super.key, required this.movie, required this.onNavigateBack});

  final MovieDetail movie;
  final VoidCallback onNavigateBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: movie.posterPath != null
                    ? imageUrl + movie.posterPath!
                    : placeholderImageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.8),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ),
              Positioned(
                top: 48,
                left: 16,
                child: GestureDetector(
                  onTap: onNavigateBack,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.4),
                        Colors.black.withValues(alpha: 0.6),
                        Colors.black.withValues(alpha: 0.8),
                        Colors.black
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/imdb-logo.png',
                              scale: 7,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(movie.voteAverage!.toString())
                          ],
                        ),
                        Text(
                          movie.title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _buildGenreChipList(movie.genres!),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildGenreChipList(List<Genre> genres) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return _buildGenreChip(genres[index].name!);
          }),
    );
  }

  _buildGenreChip(String genre) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.fromBorderSide(
          BorderSide(color: Colors.blue),
        ),
      ),
      child: Text(
        genre,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
