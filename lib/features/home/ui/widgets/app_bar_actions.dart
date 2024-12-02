import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/app_bar_helpers.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeDataCubit>().state is ThemeDataDark;
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.dark_mode, color: iconColor),
          tooltip: 'Toggle Theme',
          onPressed: () {
            AppBarHelpers.toggleTheme(context, isDarkMode);
          },
        ),
        BlocProvider(
          create: (context) => CartCubitCubit(),
          child: BlocBuilder<CartCubitCubit, CartCubitState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.shopping_cart, color: iconColor),
                onPressed: () {
                  AppBarHelpers.navigateToCart(context);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
