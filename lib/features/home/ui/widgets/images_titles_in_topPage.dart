import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/image_card.dart';
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
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeRepoSuccess) {
          final books = state.data.items ?? [];
          return SizedBox(
            height: 210.h,
            child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageUrl = books[index].volumeInfo?.imageLinks?.thumbnail;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ImageCard(imageUrl: imageUrl),
                );
              },
            ),
          );
        }
        if (state is HomeRepoFailure) {
          return Center(child: Text('Error: ${state.errorHandler.error}'));
        }
        return const Center(child: Text('No Data Available'));
      },
    );
  }
}
