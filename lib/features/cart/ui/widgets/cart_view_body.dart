import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubitCubit, CartCubitState>(
        builder: (context, state) {
          if (state is CartCubitLoaded) {
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final item = state.cartItems[index];
                return ListTile(
                  title: Text(item.volumeInfo!.title.toString()), // افترض أن "name" هو اسم المنتج
                  subtitle: Text(item.volumeInfo!.language.toString()), // افترض أن "price" هو السعر
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
            return const Center(child: Text('No items in the cart'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
