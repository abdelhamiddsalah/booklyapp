import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/details/ui/details_view.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppRouting {
  final GetIt _getIt = GetIt.instance;

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return _buildHomeRoute();

      case Routes.detailsScreen:
        return _buildDetailsRoute(settings);

      default:
        return _buildNotFoundRoute();
    }
  }

  /// إنشاء الروت الخاص بـ HomeView
  MaterialPageRoute _buildHomeRoute() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => HomeRepoCubit(_getIt<HomeRepo>())..fetchDataBooks(),
        child: const HomeView(),
      ),
    );
  }

  /// إنشاء الروت الخاص بـ DetailsView
  MaterialPageRoute _buildDetailsRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments.containsKey('id')) {
      final id = arguments['id'] as String;
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => HomeRepoCubit(_getIt<HomeRepo>())..fetchDataBooks(),
          child: DetailsView(id: id),
        ),
      );
    }
    return _buildInvalidArgumentsRoute();
  }

  /// صفحة لعرض خطأ عند تمرير Arguments غير صالحة
  MaterialPageRoute _buildInvalidArgumentsRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Invalid Arguments")),
        body: const Center(
          child: Text("Invalid arguments passed to route"),
        ),
      ),
    );
  }

  /// صفحة الخطأ الافتراضية عند عدم العثور على الروت
  MaterialPageRoute _buildNotFoundRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Page Not Found")),
        body: const Center(
          child: Text("404 - Page not found"),
        ),
      ),
    );
  }
}
