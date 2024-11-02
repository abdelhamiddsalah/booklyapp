import 'package:booklyapp/core/networking/api_errors.dart';
import 'package:booklyapp/core/networking/api_result.dart';
import 'package:booklyapp/core/networking/api_services.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo({required this.apiServices});
  Future<ApiResult<booksmodel>> getBooks() async{
    try {
      final response=await apiServices.getBooks('q=search+terms');
      return Success(response);
    } catch (e) {
      return Failure(ErrorHandler());
    }
  }
}