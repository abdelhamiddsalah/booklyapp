import 'package:booklyapp/core/helper/contexts.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/details/ui/widgets/webview_details.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarInDetails extends StatelessWidget {
  final Items item;
  final int? index;

  const AppbarInDetails({
    super.key,
    required this.item,
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
            context.pop();
          },
          iconColor: iconColor,
        ),
        BlocBuilder<CartCubitCubit, CartCubitState>(
          builder: (context, state) {
            return Row(
              children: [
                _buildIconButton(
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    context.read<CartCubitCubit>().addToCart(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added to cart')),
                    );
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
            );
          },
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
