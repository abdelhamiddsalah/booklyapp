import 'package:booklyapp/core/helper/contexts.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:booklyapp/features/details/ui/widgets/webview_details.dart';
import 'package:flutter/material.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarInDetails extends StatelessWidget {
  final String bookId;
  final int index;
  final booksmodel book;

  const AppbarInDetails({
    super.key,
    required this.bookId,
    required this.index,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(
          context,
          icon: Icons.close,
          onPressed: () {
            context.pop();
          },
          iconColor: iconColor,
        ),
        Row(
          children: [
            _buildIconButton(
              context,
              icon: Icons.shopping_cart,
              onPressed: () {
                if (book.items != null && book.items!.isNotEmpty) {
                  final bookItem = book.items![index];
                  context.read<CartCubit>().addToCart(bookItem);
                }
              },
              iconColor: iconColor,
            ),
            _buildIconButton(
              context,
              icon: Icons.share_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewDetails(index: index),
                  ),
                );
              },
              iconColor: iconColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    return IconButton(
      icon: Icon(icon, color: iconColor),
      onPressed: onPressed,
    );
  }
}
