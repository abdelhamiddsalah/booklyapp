import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({super.key, required this.book});
  final Items book;

  @override
  Widget build(BuildContext context) {
    // التحقق من أن saleInfo و listPrice ليسا null
    final saleInfo = book.saleInfo;
    final listPrice = saleInfo?.listPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price :',
          style: Styles.descriptionIndetailsTitle(context: context),
        ),
        Text(
          // إذا كانت listPrice أو أي خاصية null نعرض قيمة افتراضية
          '${listPrice?.amount ?? 100.12} ${listPrice?.currencyCode ?? 'Egp'}', 
          style: Styles.priceStyle(context: context),
        ),
      ],
    );
  }
}
