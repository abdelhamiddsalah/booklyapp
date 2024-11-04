import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/models/books_model.dart';



class CartCubit extends Cubit<List<Items>> {
  CartCubit() : super([]);

  void addToCart(Items item) {
    final updatedCart = List<Items>.from(state);
    updatedCart.add(item);
    emit(updatedCart);
  }

  void removeFromCart(Items item) {
    final updatedCart = List<Items>.from(state);
    updatedCart.remove(item);
    emit(updatedCart);
  }
}
