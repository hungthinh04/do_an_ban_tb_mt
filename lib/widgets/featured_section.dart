import 'package:do_an_ban_mt/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({Key? key}) : super(key: key);

  // Hàm lấy dữ liệu từ API
  Future<List<Product>> fetchFeaturedProducts() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/products/images'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load featured products. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to connect to API: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'NỔI BẬT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_back_ios, size: 16),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ],
          ),
        ),
        // Danh sách sản phẩm nổi bật
        FutureBuilder<List<Product>>(
          future: fetchFeaturedProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    'Lỗi tải dữ liệu: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    'Không có sản phẩm nào.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            } else {
              final products = snapshot.data!;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        // Điều hướng đến trang chi tiết sản phẩm
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Ảnh sản phẩm sử dụng Image.network
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Image.network(
                                  product.image, // Sử dụng URL ảnh từ API
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            // Tên sản phẩm
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Giá
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Giá: ${product.price} đ',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
