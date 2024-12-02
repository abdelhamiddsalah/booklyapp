import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartItem {
  final Items item;

  CartItem({required this.item});
}

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial()){
    _loadCart();
  }

  final List<CartItem> _cartItems = [];

  // تحميل العناصر من الذاكرة
  void _loadCart() {
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }

  // إضافة عنصر إلى السلة
  void addToCart(Items item) {
    CartItem newItem = CartItem(item: item);
    _cartItems.add(newItem);
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }

  // إزالة عنصر من السلة
  void removeFromCart(CartItem item) {
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems.removeAt(index);
      emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
    }
  }

  // إرجاع العناصر الحالية
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
}
