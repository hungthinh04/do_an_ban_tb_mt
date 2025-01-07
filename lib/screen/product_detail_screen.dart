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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Container(
              height: 200,
              width: double.infinity,
              child: product.image.isNotEmpty
                  ? Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'Image not available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No Image Available',
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

            // Loại sản phẩm
            Text(
              'Type: ${product.type}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Giá sản phẩm
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 8),

            Text(
              'In Stock: ${product.quantityInStock}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            Text(
              'Description:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            // ID danh mục
            Text(
              'Category ID: ${product.categoryId}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
