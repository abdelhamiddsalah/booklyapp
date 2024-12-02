// ignore_for_file: file_names

import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> keyRefresh;
  final Widget child;

  const CustomRefreshIndicator({
    super.key,
    required this.keyRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: keyRefresh,
      onRefresh: () async {
        try {
          await context.read<HomeRepoCubit>().fetchDataBooks();
        } catch (e) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to refresh data')),
          );
        }
      },
      child: child,
    );
  }
}
