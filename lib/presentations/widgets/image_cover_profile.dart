import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  final String asset;
  final double? width;
  final Animation<double>? opacity;
  final FilterQuality filterQuality;
  const ImageCover(
      {super.key,
      required this.asset,
      required this.filterQuality,
      this.opacity,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: width,
      filterQuality: filterQuality,
      opacity: opacity,
    );
  }
}
