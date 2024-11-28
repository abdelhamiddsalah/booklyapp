import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class description_in_details_view extends StatelessWidget {
  const description_in_details_view({
    super.key,
    required this.book,
  });

  final Items book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description:',
          style: Styles.descriptionIndetailsTitle(context: context),
        ),
      const  SizedBox(height: 20),
        Text(
          maxLines: 2,
          book.volumeInfo!.description ?? 'No Description Available',
          style: Styles.descriptionIndetails(context: context),
        ),
      ],
    );
  }
}

