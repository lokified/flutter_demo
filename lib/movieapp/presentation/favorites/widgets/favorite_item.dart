import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

import '../../../core/constants.dart';

class FavoriteMovieItem extends StatelessWidget {
  const FavoriteMovieItem({super.key, required this.movie, this.onDeleteItem});

  final MovieDetail movie;
  final VoidCallback? onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorScheme.of(context).primary.withValues(alpha: 0.1),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl + movie.posterPath!,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: double.infinity,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.08),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: double.infinity,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.08),
                ),
                child: const CupertinoActivityIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: double.infinity,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.08),
              ),
              child: const Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        movie.overview!,
                        style: TextStyle(
                          color: ColorScheme.of(context)
                              .onSurface
                              .withValues(alpha: 0.8),
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(
                      'Rating - ${movie.voteAverage}',
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorScheme.of(context)
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: onDeleteItem, child: Icon(Icons.delete)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
