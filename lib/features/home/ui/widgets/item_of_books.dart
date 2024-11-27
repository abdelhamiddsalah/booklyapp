import 'package:booklyapp/core/helper/contexts.dart';
import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ItemOfBooks extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnailUrl;
  final String desc;
  final int index;
  final String id;
  final booksmodel bookModel; // Updated variable name to bookModel

  const ItemOfBooks({
    super.key,
    required this.title,
    required this.author,
    required this.thumbnailUrl,
    required this.id,
    required this.index,
    required this.bookModel, // Updated variable name to bookModel
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge!.color;

    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 140,
          child: InkWell(
            onTap: () {
              // Navigate to details screen and pass data
              context.pushNamed(
                Routes.detailsScreen,
                arguments: {
                  'id': id,
                  'index': index,
                  'bookModel': bookModel, // Passing bookModel instance
                },
              );
            },
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
              const SizedBox(height: 5),
              Text(
                desc,
                maxLines: 2,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Text(
                author,
                style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 6),
              _buildBookRating(textColor),
            ],
          ),
        ),
      ],
    );
  }

  /// Widget for displaying the rating information (star and review count)
  Widget _buildBookRating(Color? textColor) {
    return Row(
      children: [
        Text('12.2', style: TextStyle(color: textColor)),
        const SizedBox(width: 5),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow),
            const SizedBox(width: 5),
            Text('34', style: TextStyle(color: textColor)),
          ],
        ),
      ],
    );
  }
}
