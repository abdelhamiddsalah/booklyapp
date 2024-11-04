import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/widgets/item_of_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewBooks extends StatelessWidget {
  final bool isDarkMode;

  const ListviewBooks({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeRepoCubit, HomeRepoState>(
        builder: (context, state) {
          if (state is HomeRepoSuccess) {
            final books = state.data.items!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                final title = book.volumeInfo?.title ?? 'No Title Available';
                final author = book.volumeInfo?.authors?.first ?? 'Unknown Author';
                final thumbnailUrl = book.volumeInfo?.imageLinks?.thumbnail ?? '';
                final desc=book.volumeInfo!.description??'nb';
               // final id=book.id;
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 15),
                  child: ItemOfBooks(
                    title: title,
                    author: author,
                    thumbnailUrl: thumbnailUrl, 
                    desc:desc,
                    id: state.data.items![index].id.toString(), index: index, books: booksmodel() ,
                  ),
                );
              },
            );
          } else if (state is HomeRepoFailure) {
            return const Center(child: Text('Failed to load book data'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
