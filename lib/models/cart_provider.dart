import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  List<Map<String, dynamic>> _purchasedOrders = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;
  List<Map<String, dynamic>> get purchasedOrders => _purchasedOrders;
void addToCart(Map<String, dynamic> product) {
  _cartItems.add({...product, 'quantity': 1, 'timestamp': DateTime.now().millisecondsSinceEpoch});
  notifyListeners();
}


 void decreaseQuantity(int index) {
  if (index >= 0 && index < _cartItems.length && _cartItems[index]['quantity'] > 1) {
    _cartItems[index]['quantity']--;
    notifyListeners();
  }
}

void increaseQuantity(int index) {
  if (index >= 0 && index < _cartItems.length) {
    _cartItems[index]['quantity']++;
    notifyListeners();
  }
}


void removeItemByIndex(int index) {
  if (index >= 0 && index < _cartItems.length) {
    _cartItems.removeAt(index); // Xóa sản phẩm tại chỉ số
    notifyListeners();
  }
}



  // Xóa tất cả sản phẩm trong giỏ
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Thanh toán và chuyển sang danh sách đơn hàng đã mua
  void checkout() {
    _purchasedOrders.addAll(_cartItems);
    clearCart(); // Xóa giỏ hàng sau khi thanh toán
    notifyListeners();
  }
}
