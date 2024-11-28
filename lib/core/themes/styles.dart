import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle booklystyle({required Color color}) {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle titleInDetails({required BuildContext context}) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge!.color,
      fontWeight: FontWeight.bold,
      fontSize: 23.sp, // Using ScreenUtil here for consistency
    );
  }

  static TextStyle descriptionIndetailsTitle({required BuildContext context}) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge!.color,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  static TextStyle descriptionIndetails({required BuildContext context}) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge!.color,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle priceStyle({required BuildContext context}) {
    return const TextStyle(
      color: Colors.orange,
      fontWeight: FontWeight.w600,
      fontSize: 17
    );
  }
}
