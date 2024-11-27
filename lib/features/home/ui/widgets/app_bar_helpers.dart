import 'package:booklyapp/core/helper/enums.dart';
import 'package:booklyapp/features/cart/ui/widgets/cart_view.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHelpers {
  /// Toggle between light and dark theme
  static void toggleTheme(BuildContext context, bool isDarkMode) {
    final newTheme = isDarkMode ? ThemeStates.light : ThemeStates.dark;
    context.read<ThemeDataCubit>().toggleTheme(newTheme);
  }

  /// Navigate to the Cart page
  static void navigateToCart(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  CartPage()),
    );
  }
}
