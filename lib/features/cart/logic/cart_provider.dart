import 'package:ecommerce_app_api_26/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addToCart(CartItem product) {
    int index = _items.indexWhere((element) => element.title == product.title);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void updateQuantity(int index, bool isAdd) {
    if (isAdd) {
      _items[index].quantity++;
    } else {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }
}
