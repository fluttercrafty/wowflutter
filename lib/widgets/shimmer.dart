import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  final int length;

  const PostShimmer({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        length,
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: PostWidgetShimmer(),
        ),
      ),
    );
  }
}

class PostWidgetShimmer extends StatelessWidget {
  const PostWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
    final highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

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
