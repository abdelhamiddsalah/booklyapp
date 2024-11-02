import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/appbar_in_homeview.dart';
import 'package:booklyapp/features/home/ui/widgets/images_titles_in_topPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataCubit, ThemeDataState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeDataDark;
        return Scaffold(
          backgroundColor: isDarkMode ? AppThemes.darkTheme.scaffoldBackgroundColor : AppThemes.lightTheme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Column(
                children: [
                  AppBarInHomeView(),
                   SizedBox(height: 20.h),
                  const ImagesTitlesInToppage(),
                  SizedBox(height: 35.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Best Seller',
                        style: TextStyle(color: isDarkMode ? AppThemes.lightTheme.textTheme.bodyLarge!.color
                                  : AppThemes.darkTheme.textTheme.bodyLarge!.color,fontWeight: FontWeight.bold,fontSize: 20.sp), // استخدام اللون الصحيح
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
