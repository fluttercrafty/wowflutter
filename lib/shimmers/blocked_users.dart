import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserList extends StatelessWidget {
  final int itemCount;
  final dynamic baseColor;
  final dynamic highlightColor;
  const ShimmerUserList({
    super.key,
    this.itemCount = 5,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
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

final hmacKeys = [
  'a3d8b92c6d1e8f8e3b7a4d9c2a6b8e17',
  '6c9b8a3f4d5e7c2b1a8d4e6f9b2c7d1e',
  'b9d4a5c3e8f7c1d6a2f9e4b3c6a7d2e5'
];
