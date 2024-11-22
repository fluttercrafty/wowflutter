import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InvitationLinksShimmer extends StatelessWidget {
  const InvitationLinksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
    final highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Top Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
              ],
            ),
            const SizedBox(height: 16),
            // Generate Links Button
            _buildShimmerBox(baseColor, highlightColor,
                width: double.infinity, height: 45),
            const SizedBox(height: 16),
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
                _buildShimmerBox(baseColor, highlightColor,
                    width: 80, height: 20),
              ],
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            // Shimmer Rows for Invitation List
            ...List.generate(
                3, (index) => _buildShimmerRow(baseColor, highlightColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox(Color baseColor, Color highlightColor,
      {required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildShimmerRow(Color baseColor, Color highlightColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildShimmerBox(baseColor, highlightColor,
              width: 80, height: 20), // Placeholder for Invited User
          _buildShimmerBox(baseColor, highlightColor,
              width: 100, height: 20), // Placeholder for Date
          Row(
            children: [
              _buildShimmerBox(baseColor, highlightColor,
                  width: 80, height: 20), // Placeholder for Url
              const SizedBox(width: 8),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Icon(
                  Icons.copy,
                  size: 20,
                  color: baseColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
