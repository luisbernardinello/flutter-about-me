import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const AppImageWidget(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (imageUrl.contains("assets"))
          ? Container()
          : (imageUrl.contains("assets"))
              ? Container(
                  child: Image.asset(
                    imageUrl,
                    width: width,
                    height: height,
                    fit: fit,
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: width,
                  height: height,
                  fit: fit,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
    );
  }
}
