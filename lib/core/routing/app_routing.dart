import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit.dart';
import 'package:booklyapp/features/details/ui/details_view.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppRouting {
  final GetIt getIt = GetIt.instance;

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomeRepoCubit(getIt<HomeRepo>())..fetchDataBooks(),
            child: HomeView(),
          ),
        );
      case Routes.detailsScreen:
        // Ensure `settings.arguments` is a Map and contains required keys
        if (settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          final id = args['id'] as String;
          final index = args['index'] as int;
          final books = args['books'] as booksmodel;
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      HomeRepoCubit(getIt<HomeRepo>())..fetchDataBooks(),
                ),
                BlocProvider(
                  create: (context) => CartCubit(),
                ),
              ],
              child: DetailsView(
                id: id,
                index: index,
                books: books,
              ),
            ),
          );
        }
        // Fallback for missing or incorrect arguments
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Invalid arguments")),
            body:
                const Center(child: Text("Invalid arguments passed to route")),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Page not found")),
            body: const Center(child: Text("404 - Page not found")),
          ),
        );
    }
  }
}
