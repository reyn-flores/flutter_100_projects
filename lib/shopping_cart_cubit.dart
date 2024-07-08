import 'package:flutter_100_projects/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<int> {
  ShoppingCartCubit() : super(0);

  List<Product> shoppingCart = [];

  void addToCart(Product product) {
    shoppingCart.add(product);
    emit(shoppingCart.length);
  }
}
