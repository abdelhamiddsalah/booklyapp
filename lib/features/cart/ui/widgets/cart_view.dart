import 'package:booklyapp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: BlocBuilder<CartCubit, List<Items>>(
        builder: (context, cartItems) {
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                title: Text(item.volumeInfo?.title ?? 'No Title'),
                subtitle: Text(
                    item.volumeInfo?.authors?.join(', ') ?? 'No Authors'),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () =>
                      context.read<CartCubit>().removeFromCart(item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
