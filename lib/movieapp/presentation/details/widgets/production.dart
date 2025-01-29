import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentali/movieapp/core/constants.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

class Production extends StatelessWidget {
  const Production({super.key, required this.productions});

  final List<ProductionCompany> productions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: productions.length,
          itemBuilder: (context, index) =>
              _buildProductionItem(context, productions[index])),
    );
  }

  _buildProductionItem(BuildContext context, ProductionCompany company) {
    return Container(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: company.logoPath == null
                ? placeholderImageUrl
                : imageUrl + company.logoPath!,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.contain),
                ),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: const CupertinoActivityIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: const Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.name!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                company.originCountry!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      ColorScheme.of(context).onSurface.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
