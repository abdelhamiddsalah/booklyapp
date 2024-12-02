import 'package:booklyapp/core/di/depency_injection.dart';
import 'package:booklyapp/core/helper/sharedPrefernces_helper.dart';
import 'package:booklyapp/core/routing/app_routing.dart';
import 'package:booklyapp/core/routing/routes.dart';
import 'package:booklyapp/core/themes/app_themes.dart';
import 'package:booklyapp/features/home/logic/cubit/theme_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  await SharedPrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeDataCubit(),
          child: BlocBuilder<ThemeDataCubit, ThemeDataState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: state is ThemeDataDark
                    ? AppThemes.darkTheme
                    : AppThemes.lightTheme,
                initialRoute: Routes.homeScreen,
                onGenerateRoute: (settings) => AppRouting().onGenerateRoute(settings),
              );
            },
          ),
        );
      },
    );
  }
}
