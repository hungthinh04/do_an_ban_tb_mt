import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000'; // URL của API

  // Lấy danh sách sản phẩm
  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

   static Future<List<dynamic>> fetchProductsSTT() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Thêm sản phẩm mới
  Future<bool> addProduct(Map<String, dynamic> product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product),
    );
    return response.statusCode == 201;
  }

  // Lấy danh sách khách hàng
  Future<List<dynamic>> fetchCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load customers');
    }
  }

  static Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Cập nhật trạng thái đơn hàng
  Future<bool> updateOrderStatus(int orderId, String status) async {
    final response = await http.put(
      Uri.parse('$baseUrl/orders/$orderId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'Status': status}),
    );
    return response.statusCode == 200;
  }

  // Xóa sản phẩm
  Future<bool> deleteProduct(int productId) async {
    final response = await http.delete(Uri.parse('$baseUrl/products/$productId'));
    return response.statusCode == 200;
  }
}
