// lib/features/home/ui/views/home_view_body.dart
import 'package:booklyapp/features/home/ui/widgets/appbar_in_homeview.dart';
import 'package:booklyapp/features/home/ui/widgets/images_titles_in_topPage.dart';
import 'package:booklyapp/features/home/ui/widgets/listview_books.dart';
import 'package:booklyapp/features/home/ui/widgets/refreshIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      keyRefresh: keyRefresh,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarInHomeView(),
                SizedBox(height: 20.h),
                const ImagesTitlesInToppage(),
                SizedBox(height: 35.h),
                _buildBestSellerTitle(context),
                SizedBox(height: 10.h),
                const ListviewBooks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildBestSellerTitle(BuildContext context) {
    return Text(
      'Best Seller',
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    );
  }
}
