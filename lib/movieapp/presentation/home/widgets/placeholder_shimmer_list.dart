import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmerList extends StatelessWidget {
  const PlaceholderShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Shimmer.fromColors(
                    baseColor: ColorScheme.of(context).onSurface,
                    highlightColor: ColorScheme.of(context).onSurface.withValues(alpha: 0.5),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorScheme.of(context).onSurface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )));
          }),
    );
  }
}
