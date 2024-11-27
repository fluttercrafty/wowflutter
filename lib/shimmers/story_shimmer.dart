import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoriesShimmerList extends StatelessWidget {
  const StoriesShimmerList({
    super.key,
    required this.borderColor,
    required this.baseColor,
    required this.highlightColor,
  });
  final dynamic baseColor;
  final dynamic borderColor;
  final dynamic highlightColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of shimmer placeholders
        itemBuilder: (context, index) {
          return ShimmerStoryWidget(
            baseColor: baseColor,
            borderColor: borderColor,
            highlightColor: highlightColor,
          );
        },
      ),
    );
  }
}

class ShimmerStoryWidget extends StatelessWidget {
  const ShimmerStoryWidget({
    super.key,
    required this.borderColor,
    required this.baseColor,
    required this.highlightColor,
  });
  final dynamic baseColor;
  final dynamic borderColor;
  final dynamic highlightColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
        color: baseColor,
      ),
      child: Stack(
        children: [
          // Background shimmer for the story image
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: baseColor,
              ),
            ),
          ),
          // Circle shimmer for the avatar
          Positioned(
            top: 5,
            left: 5,
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: CircleAvatar(
                backgroundColor: baseColor,
                radius: 22,
              ),
            ),
          ),
          // Shimmer for the name text
          Positioned(
            bottom: 5,
            left: 10,
            right: 10,
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 10,
                width: 60,
                color: baseColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
