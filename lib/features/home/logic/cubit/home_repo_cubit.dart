import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/networking/api_errors.dart';
import 'package:booklyapp/core/networking/api_result.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_repo_state.dart';

class HomeRepoCubit extends Cubit<HomeRepoState> {
  final HomeRepo homeRepo;
  HomeRepoCubit(this.homeRepo) : super(HomeRepoInitial());

 Future<void> fetchDataBooks()async{
    emit(HomeRepoLoading()); // تعيين الحالة إلى تحميل

    final result = await homeRepo.getBooks();
      if (result is Success<booksmodel>) {
        emit(HomeRepoSuccess(result.data)); // تعيين الحالة إلى نجاح مع البيانات
    } else if (result is Failure<ErrorHandler>) {
        emit(HomeRepoFailure(ErrorHandler())); // تعيين الحالة إلى فشل مع خطأ
    }
  }
}
