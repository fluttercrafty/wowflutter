import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  final int length;
  final dynamic baseColor;
  final dynamic highlightColor;
  const PostShimmer({
    super.key,
    required this.length,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: PostWidgetShimmer(
            baseColor: baseColor,
            highlightColor: highlightColor,
          ),
        ),
      ),
    );
  }
}

class PostWidgetShimmer extends StatelessWidget {
  const PostWidgetShimmer({
    super.key,
    required this.baseColor,
    required this.highlightColor,
  });
  final dynamic baseColor;
  final dynamic highlightColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.white.withOpacity(0.1) : Colors.white,
      ),
      child: Column(
        children: [
          // Header with profile picture and username
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: const CircleAvatar(
                      radius: 20, backgroundColor: Colors.grey),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      child: Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(Icons.more_vert, color: baseColor),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Shimmer for text content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(bottom: 5),
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Shimmer for media preview (image/video)
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),

          // Shimmer for bottom buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonShimmer(baseColor, highlightColor),
                _buildButtonShimmer(baseColor, highlightColor),
                _buildButtonShimmer(baseColor, highlightColor),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildButtonShimmer(Color baseColor, Color highlightColor) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
