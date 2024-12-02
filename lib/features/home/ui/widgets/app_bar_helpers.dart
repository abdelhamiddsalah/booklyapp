import 'package:booklyapp/core/helper/enums.dart';
import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHelpers {
  static void toggleTheme(BuildContext context, bool isDarkMode) {
    final newTheme = isDarkMode ? ThemeStates.light : ThemeStates.dark;
    context.read<ThemeDataCubit>().toggleTheme(newTheme);
  }

  static void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, Routes.cartScreen);
  }
}

