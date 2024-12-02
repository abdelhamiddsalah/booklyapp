import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());

  final List<Items> _cartItems = [];

  // To load cart items
  void loadCart() {
    if (isClosed) return; // Prevent emitting state if cubit is closed
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }

  // To add an item to the cart
 void addToCart(Items item) {
  print('Before adding item: $_cartItems');
  if (isClosed) return; // Prevent emitting state if cubit is closed
  if (_cartItems.contains(item)) return; // Prevent duplicates
  _cartItems.add(item); // Add the item
  print('After adding item: $_cartItems');
  emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems))); // Emit the new state
}


  // To remove an item from the cart
  void removeFromCart(cartItem) {
    if (isClosed) return; // Prevent emitting state if cubit is closed
    _cartItems.remove(cartItem.item);
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }

  // To get the current cart items
  List<Items> get cartItems => List.unmodifiable(_cartItems);
}
