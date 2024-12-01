import 'package:booklyapp/core/themes/styles.dart';
import 'package:booklyapp/features/details/ui/widgets/appbar_in_details.dart';
import 'package:booklyapp/features/details/ui/widgets/description_in_details_view.dart';
import 'package:booklyapp/features/details/ui/widgets/image_in_details_view.dart';
import 'package:booklyapp/features/details/ui/widgets/row_price.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/images_titles_in_topPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsViewBody extends StatelessWidget {
  final String id;

  const DetailsViewBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRepoCubit, HomeRepoState>(
      builder: (context, state) {
        if (state is HomeRepoSuccess) {
          final book = state.data.items?.firstWhere(
            (book) => book.id == id,
          );

          if (book == null) {
            return _buildErrorState(context, "Book not found");
          }

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppbarInDetails(item: book),
                      SizedBox(height: 15.h),
                      image_in_details_view(book: book),
                      SizedBox(height: 30.h),
                      Text(
                        book.volumeInfo?.title ?? 'No Title',
                        style: Styles.titleInDetails(context: context),
                      ),
                      SizedBox(height: 20.h),
                      RowPrice(book: book),
                      SizedBox(height: 20.h),
                      description_in_details_view(book: book),
                      SizedBox(height: 20.h),
                      Text(
                        'Top Popular:',
                        style: Styles.descriptionIndetailsTitle(context: context),
                      ),
                      SizedBox(height: 20.h),
                      const ImagesTitlesInToppage(),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is HomeRepoFailure) {
          return _buildErrorState(context, "Failed to load data");
        }

        return _buildLoadingState(context);
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Text(message, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
