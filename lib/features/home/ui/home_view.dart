import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/appbar_in_homeview.dart';
import 'package:booklyapp/features/home/ui/widgets/images_titles_in_topPage.dart';
import 'package:booklyapp/features/home/ui/widgets/listview_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});

  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataCubit, ThemeDataState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeDataDark;
        final backgroundColor = isDarkMode
            ? AppThemes.darkTheme.scaffoldBackgroundColor
            : AppThemes.lightTheme.scaffoldBackgroundColor;

        return RefreshIndicator(
          key: keyRefresh,
          onRefresh: () {
            return context.read<HomeRepoCubit>().fetchDataBooks();
          },
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarInHomeView(),
                    SizedBox(height: 20.h),
                     ImagesTitlesInToppage(),
                    SizedBox(height: 35.h),
                    Text(
                      'Best Seller',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListviewBooks(isDarkMode: isDarkMode),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
