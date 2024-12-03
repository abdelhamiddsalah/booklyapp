import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<CartCubitCubit>().loadCart();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubitCubit, CartCubitState>(
        builder: (context, state) {
          if (state is CartCubitLoaded) {
            final c=state.cartItems;
            if (state.cartItems.isEmpty) {
              return const Center(child: Text('Your cart is empty.'));
            }
            return ListView.builder(
              itemCount: c.length,
              itemBuilder: (context, index) {
                final item = c[index];
                return ListTile(
                  title: Text(
                    item.volumeInfo?.title ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Language: ${item.volumeInfo?.language ?? 'Unknown'}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      context.read<CartCubitCubit>().removeFromCart(item);
                    },
                  ),
                );
              },
            );
          } else if (state is CartCubitInitial) {
            return const Center(child: Text('Loading cart items...'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
