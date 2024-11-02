import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ItemOfBooks extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnailUrl;

  const ItemOfBooks({super.key,required this.title,required this.author,required this.thumbnailUrl});
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 2.6 / 3.7,
              child: FancyShimmerImage(
                imageUrl: thumbnailUrl,
                boxFit: BoxFit.fill,
                errorWidget: const Icon(Icons.error),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                author,
                style: TextStyle(color: textColor, fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('12.2', style: TextStyle(color: textColor)),
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text('34', style: TextStyle(color: textColor)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
