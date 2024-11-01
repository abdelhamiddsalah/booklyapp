part of 'theme_data_cubit.dart';

@immutable
sealed class ThemeDataState {}

final class ThemeDataInitial extends ThemeDataState {}
final class ThemeDataLight extends ThemeDataState {}
final class ThemeDataDark extends ThemeDataState {}
