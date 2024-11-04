import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/details/ui/widgets/appbar_in_details.dart';
import 'package:booklyapp/features/details/ui/widgets/description_in_details_view.dart';
import 'package:booklyapp/features/details/ui/widgets/image_in_details_view.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id, required this.index, required this.books});
  final String id;
  final int index;
  final booksmodel books;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeDataCubit>().state is ThemeDataDark;
    final backgroundColor = isDarkMode
        ? AppThemes.darkTheme.scaffoldBackgroundColor: AppThemes.lightTheme.scaffoldBackgroundColor;
    
    return BlocBuilder<HomeRepoCubit, HomeRepoState>(
      builder: (context, state) {
        if (state is HomeRepoLoading) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        
        if (state is HomeRepoSuccess) {
          final book = state.data.items!.firstWhere((book) => book.id == id);
          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppbarInDetails(bookId: book.id.toString(), index: index, book:books ),
                      const SizedBox(height: 30),
                      image_in_details_view(book: book),
                      const SizedBox(height: 30),
                      Text(
                        book.volumeInfo?.title ?? 'No Title',
                        textAlign: TextAlign.start,
                        style: Styles.titleInDetails(context: context),
                      ),
                      const SizedBox(height: 20),
                      description_in_details_view(book: book),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is HomeRepoFailure) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: const Center(child: Text("Failed to load data")),
          );
        }
        
        return const SizedBox.shrink();
      },
    );
  }
}
