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
          // البحث عن الكتاب باستخدام id
          final book = state.data.items?.firstWhere(
            (book) => book.id == id,
          );
          if (book == null) {
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(child: Text("Book not found")),
            );
          }

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppbarInDetails(),
                      const SizedBox(height: 15),
                      image_in_details_view(book: book),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          book.volumeInfo?.title ?? 'No Title',
                          textAlign: TextAlign.start,
                          style: Styles.titleInDetails(context: context),
                        ),
                      ),
                      const SizedBox(height: 20),
                                            RowPrice(book: book),
                     const SizedBox(height: 20,),
                      description_in_details_view(book: book),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Top Popular :',style: Styles.descriptionIndetailsTitle(context: context),)),
                       const SizedBox(height: 20,),
                     const ImagesTitlesInToppage()

                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is HomeRepoFailure) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: const Center(child: Text("Failed to load data")),
          );
        }

        // عرض مؤشر تحميل أثناء جلب البيانات
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
