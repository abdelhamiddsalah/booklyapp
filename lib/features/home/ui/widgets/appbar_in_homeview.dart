import 'package:booklyapp/features/home/ui/widgets/app_bar_title.dart';
import 'package:booklyapp/features/home/ui/widgets/app_bar_actions.dart';
import 'package:flutter/material.dart';

class AppBarInHomeView extends StatelessWidget {
  const AppBarInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarTitle(),
        AppBarActions(),
      ],
    );
  }
}
