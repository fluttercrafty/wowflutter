import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerList extends StatelessWidget {
  const NotificationShimmerList({
    super.key,
    required this.baseColor,
    required this.highlightColor,
  });
  final dynamic baseColor;
  final dynamic highlightColor;

  @override
  Widget build(BuildContext context) {   
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
  final dynamic baseColor;
  final dynamic highlightColor;

  const NotificationShimmer({
    super.key,
    required this.length,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return NotificationShimmerList(
          baseColor: baseColor,
          highlightColor: highlightColor,
        );
      },
    );
  }
}
