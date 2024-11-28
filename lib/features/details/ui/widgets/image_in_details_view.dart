import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class image_in_details_view extends StatelessWidget {
  const image_in_details_view({
    super.key,
    required this.book,
  });

  final Items book;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: FancyShimmerImage(
        imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
        width: 140.w,
        height: 240.h,
        errorWidget:const Icon(Icons.error), // في حالة وجود خطأ في تحميل الصورة
      ),
    );
  }
}
