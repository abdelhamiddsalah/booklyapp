part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}

final class CartCubitLoaded extends CartCubitState {
  final List<Items> cartItems; // تعديل النوع ليكون `Items`

  CartCubitLoaded({required this.cartItems});
}
