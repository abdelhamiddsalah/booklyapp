import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/details/ui/widgets/webview_details.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
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

    return BlocBuilder<HomeRepoCubit, HomeRepoState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(
              icon: Icons.close,
              onPressed: () {
                Navigator.pop(context); // أفضل من context.pop()
              },
              iconColor: iconColor,
            ),
            Row(
              children: [
                _buildIconButton(
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    context.read<CartCubitCubit>().addToCart(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${item.volumeInfo?.title} added to cart'),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            context.read<CartCubitCubit>().removeFromCart(item);
                          },
                        ),
                      ),
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
                        builder: (context) => WebviewDetails(index: index ?? 0),
                      ),
                    );
                  },
                  iconColor: iconColor,
                ),
              ],
            )
          ],
        );
      },
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
