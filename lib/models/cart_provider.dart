import 'package:flutter/foundation.dart';
import 'package:bad_tech/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _selectedProducts = [];

  List<Product> get selectedProducts => _selectedProducts;

  void addToCart(Product product) {
    _selectedProducts.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _selectedProducts.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _selectedProducts.clear();
    notifyListeners();
  }
}
