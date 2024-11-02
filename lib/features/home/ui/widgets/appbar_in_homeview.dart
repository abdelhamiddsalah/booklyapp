import 'package:booklyapp/core/helper/enums.dart';
import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarInHomeView extends StatelessWidget {
  const AppBarInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the current theme state from ThemeDataCubit
    final isDarkMode = context.watch<ThemeDataCubit>().state is ThemeDataDark;
    final iconColor = Theme.of(context).textTheme.bodyLarge?.color ;
  

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Bookly',
          style: Styles.booklystyle(color: iconColor ?? Colors.black),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.dark_mode, color: iconColor),
              onPressed: () {
                context.read<ThemeDataCubit>().toggleTheme(
                      isDarkMode ? ThemeStates.light : ThemeStates.dark,
                    );
              },
            ),
            Icon(Icons.search, color: iconColor),
          ],
        ),
      ],
    );
  }
}
