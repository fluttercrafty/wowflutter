import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserList extends StatelessWidget {
  final int itemCount;

  const ShimmerUserList({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300;
    final highlightColor =
        isDarkMode ? Colors.grey.shade600 : Colors.grey.shade100;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Circle Shimmer for Profile Image
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: baseColor,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // Name Shimmer Placeholder
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: baseColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // Button Shimmer Placeholder
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: baseColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
