import 'package:booklyapp/core/networking/apiConstants.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: Apiconstants.apiBaseurl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET(Apiconstants.endpoint)
  Future<booksmodel> getBooks(@Query("q") String searchTerms);
}