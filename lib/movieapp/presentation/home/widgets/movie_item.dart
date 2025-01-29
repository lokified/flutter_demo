import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentali/movieapp/core/constants.dart';
import 'package:mentali/movieapp/domain/entities/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie, required this.onTap});

  final Movie movie;
  final Function(int?) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(movie.id);
      },
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            _buildImage(context),
            SizedBox(
              height: 4,
            ),
            Text(
              movie.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl + movie.posterPath,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: MediaQuery.of(context).size.width / 2.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: MediaQuery.of(context).size.width / 2.0,
            width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.08),
          ),
          child: const CupertinoActivityIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: MediaQuery.of(context).size.width / 2.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.08),
        ),
        child: const Icon(Icons.error),
      ),
    );
  }
}
