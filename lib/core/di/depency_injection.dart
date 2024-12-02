import 'package:booklyapp/core/networking/api_services.dart';
import 'package:booklyapp/core/networking/dio_factory.dart';
import 'package:booklyapp/features/cart/logic/cubit/cart_cubit_cubit.dart';
import 'package:booklyapp/features/home/logic/cubit/home_repo_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiServices: getIt<ApiServices>()));

  // Cubits
  getIt.registerFactory<HomeRepoCubit>(() => HomeRepoCubit(getIt<HomeRepo>()));

   getIt.registerLazySingleton<CartCubitCubit>(() => CartCubitCubit());
}

