import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesTitlesInToppage extends StatelessWidget {
  const ImagesTitlesInToppage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRepoCubit, HomeRepoState>(
      builder: (context, state) {
        if (state is HomeRepoLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HomeRepoSuccess) {
          return SizedBox(
            height: 210.h,
            child: ListView.builder(
              itemCount: state.data.items?.length ?? 0, // استخدام عدد العناصر
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageUrl = state.data.items![index].volumeInfo?.imageLinks?.thumbnail;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 2.6 / 3.7,
                      child: FancyShimmerImage(
                        imageUrl: imageUrl ?? '', // تمرير عنوان الصورة مباشرة
                        boxFit: BoxFit.fill, // ضبط صورة الوعاء
                        errorWidget: Icon(Icons.error), // عرض أيقونة خطأ إذا فشلت الصورة في التحميل
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (state is HomeRepoFailure) {
          return Center(child: Text('Error: ${state.errorHandler.error}'));
        }
        return Center(child: Text('No Data Available')); // حالة افتراضية
      },
    );
  }
}
