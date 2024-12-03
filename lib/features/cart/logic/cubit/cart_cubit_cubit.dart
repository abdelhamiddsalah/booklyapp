import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());

  final List<Items> _cartItems = [];

  // لتحميل العناصر في السلة
  void loadCart() {
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }

  // لإضافة عنصر إلى السلة
  // تأكد من أن دالة إضافة العناصر إلى السلة تعمل كما هو متوقع.
void addToCart(Items item) {
  if (!_cartItems.contains(item)) {
    _cartItems.add(item);
    emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
  }
}


  // لحذف عنصر من السلة
  void removeFromCart(Items item) {
    try {
      _cartItems.remove(item);
      emit(CartCubitLoaded(cartItems: List.unmodifiable(_cartItems)));
    } catch (e) {
      emit(CartCubitError(message: "Failed to remove item from cart"));
    }
  }

  // للحصول على العناصر الحالية في السلة
  List<Items> get cartItems => List.unmodifiable(_cartItems);
}
