import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerList extends StatelessWidget {
  const NotificationShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
    final highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

    return ListTile(
      leading: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: baseColor,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: 10,
          width: 100,
          color: baseColor,
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: 10,
          width: 80,
          color: baseColor,
          margin: const EdgeInsets.only(top: 5),
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: 10,
          width: 30,
          color: baseColor,
        ),
      ),
    );
  }
}

class NotificationShimmer extends StatelessWidget {
  final int length;

  const NotificationShimmer({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return const NotificationShimmerList();
      },
    );
  }
}
