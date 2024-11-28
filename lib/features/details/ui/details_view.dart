import 'package:booklyapp/features/details/ui/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String id;
  const DetailsView({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
   
    return  DetailsViewBody(id: id,);
  }
}
