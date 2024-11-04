import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final booksmodel book;
  final int index;
  const CartItemCard({super.key, required this.book, required this.index});

  @override
  Widget build(BuildContext context) {
    final title = book.items?[index].volumeInfo?.title ?? 'No Title';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(13.0),
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Group 2 (2).png', height: 100, width: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
