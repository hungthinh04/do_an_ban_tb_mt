import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  List<Map<String, dynamic>> _purchasedOrders = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;
  List<Map<String, dynamic>> get purchasedOrders => _purchasedOrders;

  // Thêm sản phẩm vào giỏ
  void addToCart(Map<String, dynamic> product) {
    // Kiểm tra xem sản phẩm đã có trong giỏ chưa, nếu có thì tăng số lượng
    final existingProductIndex = _cartItems.indexWhere((item) => item['id'] == product['id']);
    if (existingProductIndex >= 0) {
      // Nếu sản phẩm đã có, tăng số lượng lên 1
      _cartItems[existingProductIndex]['quantity']++;
    } else {
      // Nếu chưa có trong giỏ, thêm mới vào giỏ hàng
      _cartItems.add({...product, 'quantity': 1});
    }
    notifyListeners(); // Cập nhật lại giao diện
  }

  // Giảm số lượng sản phẩm trong giỏ
  void decreaseQuantity(String itemId) {
    final itemIndex = _cartItems.indexWhere((item) => item['id'] == itemId);
    if (itemIndex != -1 && _cartItems[itemIndex]['quantity'] > 1) {
      _cartItems[itemIndex]['quantity']--;
      notifyListeners();
    }
  }

  // Tăng số lượng sản phẩm trong giỏ
  void increaseQuantity(String itemId) {
    final itemIndex = _cartItems.indexWhere((item) => item['id'] == itemId);
    if (itemIndex != -1) {
      _cartItems[itemIndex]['quantity']++;
      notifyListeners();
    }
  }

  // Xóa sản phẩm khỏi giỏ
  void removeItem(String id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners(); // Cập nhật lại giao diện
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
