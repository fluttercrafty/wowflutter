import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wowflutter/svg_strings.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.width = 50,
    this.height = 50,
    this.radius = 0,
    this.fit = BoxFit.cover,
    this.margin = const EdgeInsets.all(0),
    this.boxShadow = const BoxShadow(color: Colors.transparent, blurRadius: 0),
  });

  final dynamic imageUrl;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;
  final EdgeInsets margin;
  final BoxShadow boxShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
    final highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: [boxShadow],
            borderRadius: BorderRadius.circular(radius)),
        child: CachedNetworkImage(
          width: width,
          height: height,
          fit: fit,
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
                width: width, height: height, color: Colors.grey[200]),
          ),
          errorWidget: (context, url, error) => Center(
              child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? const Color(0xFF727272)
                    : const Color(0xFFE7EAF3),
                borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(TSvgs.placeholder,
                height: MediaQuery.of(context).size.width * 0.5),
          )),
        ),
      ),
    );
  }
}
