import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String? imageUrl;

  const ImageCard({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 3.7,
        child: FancyShimmerImage(
          imageUrl: ImageCardHelpers.validateImageUrl(imageUrl),
          boxFit: BoxFit.fill,
          errorWidget: const Icon(Icons.error),
        ),
      ),
    );
  }
}
class ImageCardHelpers {
  /// Validate the image URL, return a placeholder if the URL is null or empty.
  static String validateImageUrl(String? url) {
    return url?.isNotEmpty == true
        ? url!
        : 'https://via.placeholder.com/150'; // رابط صورة افتراضية
  }
}

