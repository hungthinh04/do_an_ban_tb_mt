import 'package:do_an_ban_mt/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: product.image.isNotEmpty
                  ? Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'Ảnh không có sẵn',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Ảnh không có sẵn',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
            const SizedBox(height: 16),

            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              'Thương hiệu: ${product.brand}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),

            Text(
              'Loại sản phẩm: ${product.type}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),

            Text(
              'Giá: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 8),

            // Số lượng trong kho
            Text(
              'Số lượng trong kho: ${product.quantityInStock}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Mô tả sản phẩm
            Text(
              'Mô tả:',
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
