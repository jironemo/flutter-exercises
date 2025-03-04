import 'package:flutter/material.dart';
import 'bouquet.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Bouquet> _cart = {};

  List<Bouquet> get cart => _cart.values.toList();

  double get totalPrice {
    double total = 0;
    for (var item in _cart.values) {
      total += item.price * item.quantity;
    }
    return total;
  }

  int get itemCount {
    int count = 0;
    for (var item in _cart.values) {
      count += item.quantity;
    }
    return count;
  }

  void addToCart(Bouquet bouquet) {
    if (_cart.containsKey(bouquet.name)) {
      _cart[bouquet.name]!.quantity++;
    } else {
      _cart[bouquet.name] = bouquet;
    }
    notifyListeners();
  }

  void removeFromCart(String name) {
    if (_cart.containsKey(name)) {
      if (_cart[name]!.quantity > 1) {
        _cart[name]!.quantity--;
      } else {
        _cart.remove(name);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Methods to increase likes and loves
  void increaseLikes(Bouquet bouquet) {
    bouquet.likes++;
    notifyListeners();
  }

  void increaseLoves(Bouquet bouquet) {
    bouquet.loves++;
    notifyListeners();
  }
}