import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTwoFactorSetup extends StatelessWidget {
  const ShimmerTwoFactorSetup({
    super.key,
    required this.baseColor,
    required this.highlightColor,
  });

  final dynamic baseColor;
  final dynamic highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 20,
              width: double.infinity,
              color: baseColor,
            ),
            const SizedBox(height: 10),
            Container(
              height: 20,
              width: 200,
              color: baseColor,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 200,
              width: 200,
              color: baseColor,
            ),
            const SizedBox(height: 20),
            Container(
              height: 20,
              width: 220,
              color: baseColor,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: baseColor,
                    thickness: 1,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 30,
                  color: baseColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: baseColor,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
