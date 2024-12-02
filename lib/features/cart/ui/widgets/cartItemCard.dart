// ignore_for_file: file_names

import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatelessWidget {
  final Items item; // العنصر المضاف إلى السلة
  final int index; // ترتيب العنصر في القائمة

  const CartItemCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final title = item.volumeInfo?.title ?? 'No Title'; 
    final imageUrl = item.volumeInfo?.imageLinks?.thumbnail; 
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        color: theme.cardColor, // دعم الوضع الداكن
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    height: 100,
                    width: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholderImage();
                    },
                  )
                : _buildPlaceholderImage(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {
                    context.read<CartCubitCubit>().removeFromCart(item);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      'assets/images/placeholder.png', 
      height: 100,
      width: 70,
      fit: BoxFit.cover,
    );
  }
}
