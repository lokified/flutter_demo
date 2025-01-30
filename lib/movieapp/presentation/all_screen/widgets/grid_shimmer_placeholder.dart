import 'package:flutter/material.dart';
import 'package:mentali/movieapp/presentation/home/widgets/placeholder_shimmer.dart';

class GridShimmerPlaceholder extends StatelessWidget {
  const GridShimmerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(height: 150, child: PlaceholderShimmer());
        });
  }
}
