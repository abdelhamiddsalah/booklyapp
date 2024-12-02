part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}
final class CartCubitLoaded extends CartCubitState {
  final List<CartItem> cartItems;

  CartCubitLoaded({required this.cartItems});
}
