import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderShimmer extends StatelessWidget {
  const PlaceholderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Shimmer.fromColors(
          baseColor: ColorScheme.of(context).onSurface,
          highlightColor: ColorScheme.of(context).onSurface.withValues(alpha: 0.5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorScheme.of(context).onSurface.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
