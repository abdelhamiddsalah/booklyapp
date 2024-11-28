import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';

class RowPrice extends StatelessWidget {
  const RowPrice({super.key, required this.book});
  final Items book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price :',
          style: Styles.descriptionIndetailsTitle(context: context),
        ),
        Text(
          '${book.saleInfo!.listPrice!.amount} ${book.saleInfo!.listPrice!.currencyCode}',style: Styles.priceStyle(context: context)
        ),
      ],
    );
  }
}
