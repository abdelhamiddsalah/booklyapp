import 'package:booklyapp/core/helper/contexts.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:booklyapp/features/details/ui/widgets/webview_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarInDetails extends StatelessWidget {
  final dynamic item; // Ensure the type matches your model, e.g., `final Items? item;`
  final int? index;

  const AppbarInDetails({
    super.key,
    required this.item, // Mark as required since it's critical for adding to cart
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(
          icon: Icons.close,
          onPressed: () {
            context.pop(); // Safely pop the navigation stack
          },
          iconColor: iconColor,
        ),
        Row(
          children: [
            _buildIconButton(
              icon: Icons.shopping_cart,
              onPressed: () {
                if (item != null) {
                  context.read<CartCubit>().addToCart(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item added to cart')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Unable to add item to cart')),
                  );
                }
              },
              iconColor: iconColor,
            ),
            _buildIconButton(
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

  Widget _buildIconButton({
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
