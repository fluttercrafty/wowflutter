import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProusers extends StatelessWidget {
  final int itemCount;
  final dynamic baseColor;
  final dynamic highlightColor;
  const ShimmerProusers({
    super.key,
    this.itemCount = 5,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  height: 14,
                  width: 50,
                  color: baseColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
