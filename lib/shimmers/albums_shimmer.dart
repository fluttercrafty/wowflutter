import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAlbumGrid extends StatelessWidget {
  final int itemCount;
  final dynamic baseColor;
  final dynamic highlightColor;

  const ShimmerAlbumGrid({
    super.key,
    this.itemCount = 6,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.9,
      ),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: baseColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: baseColor,
                    ),
                  ),
                ),
                // Album name placeholder
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: baseColor,
                    ),
                  ),
                ),
                // Photo count placeholder
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 12,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: baseColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
