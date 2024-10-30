import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/features/home/ui/widgets/home_view.dart';
import 'package:flutter/material.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
       return null;
    }
  }
}