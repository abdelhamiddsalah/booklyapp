import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/cart/ui/widgets/cartItemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubitCubit(),
        child: BlocBuilder<CartCubitCubit, CartCubitState>(
          builder: (context, state) {
            if (state is CartCubitInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartCubitLoaded) {
              if (state.cartItems.isEmpty) {
                return const Center(child: Text('Your cart is empty.'));
              }
              return ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = state.cartItems[index];
                  return CartItemCard(
                    item: cartItem.item,
                    index: index,
                  );
                },
              );
            } else {
              return const Center(child: Text('An error occurred.'));
            }
          },
        ),
      ),
    );
  }
}
