import 'package:booklyapp/core/themes/styles.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return Text(
      'Bookly',
      style: Styles.booklystyle(color: iconColor),
    );
  }
}
