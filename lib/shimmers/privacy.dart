import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PrivacySettingShimmer extends StatelessWidget {
  const PrivacySettingShimmer({
    super.key,
    required this.baseColor,
    required this.highlightColor,
  });

  final dynamic baseColor;
  final dynamic highlightColor;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: List.generate(
            6, (index) => _buildShimmerItem(baseColor, highlightColor)),
      ),
    );
  }

  Widget _buildShimmerItem(Color baseColor, Color highlightColor) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 200, height: 15, color: baseColor),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    flex: 2, child: Container(height: 25, color: baseColor)),
                const SizedBox(width: 10),
                Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(5))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
