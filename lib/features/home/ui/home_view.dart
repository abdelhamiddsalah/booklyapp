import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/appbar_in_homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataCubit, ThemeDataState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeDataDark;
        return Scaffold(
          backgroundColor: isDarkMode? AppThemes.darkTheme.scaffoldBackgroundColor : AppThemes.lightTheme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppBarInHomeView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
