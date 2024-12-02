import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/cart/ui/cart_view.dart';
import 'package:booklyapp/features/details/ui/details_view.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:booklyapp/features/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppRouting {
  final GetIt _getIt = GetIt.instance;

  // بدلاً من generateRoute، يمكن أن تُدير التنقل مباشرة باستخدام Navigator
  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, Routes.homeScreen);
  }

  void navigateToDetails(BuildContext context, String id) {
    Navigator.pushNamed(
      context,
      Routes.detailsScreen,
      arguments: {'id': id},
    );
  }

  void navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, Routes.cartScreen);
  }

  // في التوجيه العادي، لا تحتاج إلى _generateRoute أو MaterialPageRoute
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => _getIt<HomeRepoCubit>()..fetchDataBooks(),
            child: const HomeView(),
          ),
        );
      case Routes.detailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>?;
        final id = arguments?['id'] as String?;

        if (id != null) {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => _getIt<HomeRepoCubit>()..fetchDataBooks()),
                BlocProvider(create: (_) => _getIt<CartCubitCubit>()),
              ],
              child: DetailsView(id: id),
            ),
          );
        }
        return _buildInvalidArgumentsRoute();
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CartCubitCubit>(
            create: (_) => _getIt<CartCubitCubit>()..loadCart(),
            child: const CartView(),
          ),
        );
      default:
        return _buildInvalidArgumentsRoute();
    }
  }

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
}
