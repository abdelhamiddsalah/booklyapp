part of 'home_repo_cubit.dart';

@immutable
sealed class HomeRepoState {}

final class HomeRepoInitial extends HomeRepoState {}
final class HomeRepoLoading extends HomeRepoState {}
final class HomeRepoSuccess extends HomeRepoState {
  final booksmodel data;

  HomeRepoSuccess(this.data);
}
final class HomeRepoFailure extends HomeRepoState {
  final ErrorHandler errorHandler;

  HomeRepoFailure(this.errorHandler);
}