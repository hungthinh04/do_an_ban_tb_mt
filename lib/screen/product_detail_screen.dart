import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm (nếu có URL hình ảnh)
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'No Image Available', // Hiển thị khi chưa có hình ảnh
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tên sản phẩm
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Thương hiệu
            Text(
              'Brand: ${product.brand}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            // Cấu hình
            Text(
              'Processor: ${product.processor}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'RAM: ${product.ram}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Storage: ${product.storage}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Giá
            Text(
              'Price: \$${product.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 8),
            // Số lượng trong kho
            Text(
              'In Stock: ${product.quantityInStock}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Mô tả sản phẩm
            Text(
              'Description:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
