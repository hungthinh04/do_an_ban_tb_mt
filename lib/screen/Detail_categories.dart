import 'package:do_an_ban_mt/models/cart_provider.dart';
import 'package:do_an_ban_mt/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Import CartProvider

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image_url'],
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'Stock: ${product['stock']}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              product['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                // Lấy CartProvider và thêm sản phẩm vào giỏ hàng
                Provider.of<CartProvider>(context, listen: false).addToCart({
                  'name': product['name'],
                  'price': product['price'],
                  'quantity': 1, // Số lượng sản phẩm mặc định là 1
                });

                // Chuyển đến màn hình giỏ hàng
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Text("Add to Cart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
