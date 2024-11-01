import 'package:booklyapp/core/helper/enums.dart';
import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarInHomeView extends StatelessWidget {
  const AppBarInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataCubit, ThemeDataState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeDataDark;
        final iconColor = isDarkMode
            ? AppThemes.lightTheme.iconTheme.color
            : AppThemes.darkTheme.iconTheme.color;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isDarkMode ? 'Bookly' : 'Bookly',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.dark_mode,
                    color: iconColor,
                  ),
                  onPressed: () {
                    context.read<ThemeDataCubit>().toggleTheme(
                      isDarkMode ? ThemeStates.light : ThemeStates.dark,
                    );
                  },
                ),
                Icon(
                  Icons.search,
                  color: iconColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
