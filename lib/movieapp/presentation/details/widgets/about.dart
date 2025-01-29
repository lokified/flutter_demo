import 'package:flutter/material.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

class About extends StatelessWidget {
  const About({super.key, required this.movie});

  final MovieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRowItem(
            context,
            'Language',
            movie.spokenLanguages!.map((lang) => lang.name).toList().join(', '),
            'Released Date',
            movie.releaseDate ?? 'N/A'),
        SizedBox(
          height: 32,
        ),
        _buildRowItem(
            context, 'Country', movie.originCountry!.join(', '), 'Rating', movie.adult ? 'PG-18': 'PG-13' ),
      ],
    );
  }

  _buildRowItem(BuildContext context, String title1, String subTitle1,
      String title2, String subTitle2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildItem(context, title1, subTitle1),
        _buildItem(context, title2, subTitle2),
      ],
    );
  }

  _buildItem(BuildContext context, String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.44,
          child: Text(
            subTitle,
            style: TextStyle(
              color: ColorScheme.of(context).onSurface.withValues(alpha: .8),
            ),
          ),
        ),
      ],
    );
  }
}
