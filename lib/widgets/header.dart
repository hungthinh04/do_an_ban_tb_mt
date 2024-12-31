import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'Betashop',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          // Thanh tìm kiếm
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
          // Icon giỏ hàng
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 28),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
    );
  }
}
